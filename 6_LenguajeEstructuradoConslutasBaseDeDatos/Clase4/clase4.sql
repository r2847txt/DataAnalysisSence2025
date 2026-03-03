-- =====================================================================
-- Clase 4
-- Historia: "Retail Nova" — Gobernanza de datos + reglas de negocio
--
-- Objetivo: 
--   1) Montamos el modelo mínimo (clientes/productos/ventas/pedidos)
--   2) Detectamos problemas (calidad de datos + pricing)
--   3) Auditamos decisiones (INSERT con percentil y CTE RETURNING)
--   4) Ajustamos decisiones (UPDATE con subqueries/CTE)
--   5) Saneamos base (DELETE con NOT EXISTS + retención)
--
-- =====================================================================

-- =========================================================
-- 0) LIMPIEZA + SETUP
-- =========================================================
DROP TABLE IF EXISTS notificaciones;
DROP TABLE IF EXISTS auditoria_precios;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre     TEXT NOT NULL,
    segmento   TEXT NOT NULL CHECK (segmento IN ('BASICO','PLUS','VIP'))
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre      TEXT NOT NULL,
    categoria   TEXT NOT NULL,
    precio      NUMERIC(10,2) NOT NULL CHECK (precio > 0),
    stock       INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

CREATE TABLE ventas (
    id_venta    SERIAL PRIMARY KEY,
    id_cliente  INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad    INT NOT NULL CHECK (cantidad > 0),
    fecha       DATE NOT NULL
    -- Nota: intencionalmente NO ponemos FK para simular un entorno real
    -- con datos imperfectos / migraciones (así podremos crear "huérfanos").
);

CREATE TABLE pedidos (
    id_pedido   SERIAL PRIMARY KEY,
    id_cliente  INT NOT NULL,
    estado      TEXT NOT NULL CHECK (estado IN ('Abierto','Cerrado','Cancelado')),
    fecha       DATE NOT NULL DEFAULT CURRENT_DATE
    -- Sin FK por la misma razón (datos imperfectos).
);

CREATE TABLE auditoria_precios (
    id_auditoria SERIAL PRIMARY KEY,
    id_producto  INT NOT NULL,
    precio       NUMERIC(10,2) NOT NULL,
    marca        TEXT NOT NULL,            -- ej: 'p90', 'outlier_categoria'
    ts           TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE notificaciones (
    id_notif   SERIAL PRIMARY KEY,
    canal      TEXT NOT NULL CHECK (canal IN ('email','slack','sms')),
    mensaje    TEXT NOT NULL,
    ts         TIMESTAMP NOT NULL DEFAULT NOW()
);

-- =========================================================
-- 1) DATOS DE EJEMPLO (con “imperfecciones” intencionales)
-- =========================================================
INSERT INTO clientes (nombre, segmento) VALUES
('Ana',   'BASICO'),
('Bruno', 'PLUS'),
('Carla', 'VIP'),
('Diego', 'PLUS'),
('Elena', 'BASICO'),
('Fabi',  'VIP');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Café grano 1kg',      'BEBIDAS',  9.90,  120),
('Café premium 1kg',    'BEBIDAS', 18.90,   40),
('Té verde',            'BEBIDAS',  6.50,  200),
('Arroz 1kg',           'ALIMENTOS', 2.20, 500),
('Arroz orgánico 1kg',  'ALIMENTOS', 5.90,  80),
('Salmón ahumado',      'DELICATESSEN', 22.00, 25),
('Queso importado',     'DELICATESSEN', 19.50, 30),
('Galletas',            'ALIMENTOS', 1.50, 600),
('Chocolate premium',   'DELICATESSEN', 29.00, 15),
('Agua mineral',        'BEBIDAS',  1.10, 1000);

-- Ventas: metemos un par de registros “huérfanos” (cliente/producto inexistente)
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 2, '2025-01-05'),
(1, 4, 5, '2025-01-09'),
(2, 2, 1, '2025-01-12'),
(2, 1, 1, '2025-02-02'),
(3, 6, 1, '2025-02-10'),
(3, 9, 2, '2025-02-14'),
(4, 4, 10,'2025-03-01'),
(4, 8, 15,'2025-03-03'),
(5, 10,20,'2025-03-04'),
(6, 7, 1, '2025-04-01'),
(999, 1, 1,'2025-04-02'),  -- cliente huérfano
(1, 999, 1,'2025-04-03');  -- producto huérfano

-- Pedidos: también insertamos un pedido huérfano
INSERT INTO pedidos (id_cliente, estado, fecha) VALUES
(1, 'Abierto',   '2025-04-10'),
(2, 'Cerrado',   '2025-04-11'),
(3, 'Cancelado', '2025-04-11'),
(999, 'Cancelado','2025-04-12'); -- huérfano a propósito

-- Vista rápida del “mundo”
SELECT 'clientes' AS tabla, COUNT(*) AS n FROM clientes
UNION ALL
SELECT 'productos', COUNT(*) FROM productos
UNION ALL
SELECT 'ventas', COUNT(*) FROM ventas
UNION ALL
SELECT 'pedidos', COUNT(*) FROM pedidos;

-- =========================================================
-- 2) CAPÍTULO 1 — Pricing governance: detectar outliers por categoría
--    (Subquery correlacionada en WHERE)
-- Historia:
--   “El equipo de pricing sospecha que hay productos caros ‘sin justificación’.
--    Se pide listar productos cuyo precio esté sobre el promedio de su categoría.”
-- =========================================================
SELECT
  p.id_producto, p.nombre, p.categoria, p.precio,
  (SELECT ROUND(AVG(p2.precio), 2)
   FROM productos p2
   WHERE p2.categoria = p.categoria) AS avg_categoria
FROM productos p
WHERE p.precio >
  (SELECT AVG(p2.precio)
   FROM productos p2
   WHERE p2.categoria = p.categoria)
ORDER BY p.categoria, p.precio DESC;

-- (Opcional) Alternativa con ventana: útil para “mostrar KPI” sin filtrar
-- SELECT p.*,
--        ROUND(AVG(precio) OVER (PARTITION BY categoria), 2) AS avg_categoria
-- FROM productos p;

-- =========================================================
-- 3) CAPÍTULO 2 — CRM/Soporte: clientes “activos” (EXISTS)
-- Historia:
--   “Soporte quiere priorizar a quienes realmente compraron algo.”
-- =========================================================
SELECT c.id_cliente, c.nombre, c.segmento
FROM clientes c
WHERE EXISTS (
  SELECT 1
  FROM ventas v
  WHERE v.id_cliente = c.id_cliente
)
ORDER BY c.id_cliente;

-- =========================================================
-- 4) CAPÍTULO 3 — Auditoría: registrar productos top-10% en precio (percentil)
--    (Subquery escalar + INSERT ... SELECT)
-- Historia:
--   “Compliance pide monitorear el top 10% de precios para revisiones periódicas.”
-- =========================================================
INSERT INTO auditoria_precios (id_producto, precio, marca)
SELECT p.id_producto, p.precio, 'p90_precio'
FROM productos p
WHERE p.precio > (
  SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY precio)
  FROM productos
);

SELECT * FROM auditoria_precios ORDER BY ts DESC, id_auditoria DESC;

-- =========================================================
-- 5) CAPÍTULO 4 — Auditoría con trazabilidad: CTE modificadora + RETURNING
-- Historia:
--   “Además de auditar, queremos notificar qué productos entraron
--    en auditoría en este ‘corte’ (batch).”
-- =========================================================
WITH ins AS (
  INSERT INTO auditoria_precios (id_producto, precio, marca)
  SELECT p.id_producto, p.precio, 'outlier_categoria'
  FROM productos p
  WHERE p.precio >
    (SELECT AVG(p2.precio) FROM productos p2 WHERE p2.categoria = p.categoria)
  RETURNING id_producto, precio
)
INSERT INTO notificaciones (canal, mensaje)
SELECT
  'slack',
  'Producto ' || id_producto || ' entró a auditoría (outlier_categoria), precio=' || precio
FROM ins;

SELECT * FROM notificaciones ORDER BY ts DESC, id_notif DESC;

-- =========================================================
-- 6) CAPÍTULO 5 — Inventario: ajustar stock según ventas por sobre promedio
--    (Subquery tabular + agregaciones / alternativa UPDATE ... FROM)
-- Historia:
--   “Supply detectó rotación alta: productos con ventas totales > promedio
--    deben bajar stock (simulamos ajuste 10% por política interna).”
-- =========================================================

-- Versión con IN + derivadas (clásica, explícita)
UPDATE productos
SET stock = ROUND(stock * 0.90)::INT
WHERE id_producto IN (
  SELECT id_producto
  FROM ventas
  WHERE id_producto IN (SELECT id_producto FROM productos) -- evita el huérfano 999
  GROUP BY id_producto
  HAVING SUM(cantidad) >
    (SELECT AVG(total_ventas)
     FROM (
       SELECT SUM(cantidad) AS total_ventas
       FROM ventas
       WHERE id_producto IN (SELECT id_producto FROM productos)
       GROUP BY id_producto
     ) v)
);

-- Verificación post-ajuste
SELECT p.id_producto, p.nombre, p.stock
FROM productos p
ORDER BY p.id_producto;

-- Alternativa más “PostgreSQL style” con CTEs + UPDATE ... FROM (misma semántica)
-- (Deja comentado si ya corriste el UPDATE anterior)
-- WITH ventas_por_prod AS (
--   SELECT id_producto, SUM(cantidad) AS tot
--   FROM ventas
--   WHERE id_producto IN (SELECT id_producto FROM productos)
--   GROUP BY id_producto
-- ),
-- prom AS (
--   SELECT AVG(tot) AS promedio FROM ventas_por_prod
-- )
-- UPDATE productos p
-- SET stock = ROUND(p.stock * 0.90)::INT
-- FROM ventas_por_prod v, prom
-- WHERE p.id_producto = v.id_producto
--   AND v.tot > prom.promedio;

-- =========================================================
-- 7) CAPÍTULO 6 — Repricing: subir 5% precios bajo promedio de categoría
--    (Subquery correlacionada)
-- Historia:
--   “Pricing decide corregir ‘subvalorados’ dentro de cada categoría.”
-- =========================================================
UPDATE productos p
SET precio = ROUND(precio * 1.05, 2)
WHERE p.precio < (
  SELECT AVG(p2.precio)
  FROM productos p2
  WHERE p2.categoria = p.categoria
);

-- Check rápido: precio vs promedio
SELECT
  p.id_producto, p.nombre, p.categoria, p.precio,
  ROUND(AVG(p2.precio),2) AS avg_categoria
FROM productos p
JOIN productos p2 ON p2.categoria = p.categoria
GROUP BY p.id_producto, p.nombre, p.categoria, p.precio
ORDER BY p.categoria, p.precio DESC;

-- =========================================================
-- 8) CAPÍTULO 7 — Calidad de datos: eliminar pedidos cancelados sin cliente
--    (NOT EXISTS = anti-join)
-- Historia:
--   “Tras una migración, quedaron pedidos cancelados de clientes inexistentes.
--    Se deben purgar para recuperar consistencia.”
-- =========================================================
DELETE FROM pedidos p
WHERE p.estado = 'Cancelado'
  AND NOT EXISTS (
    SELECT 1
    FROM clientes c
    WHERE c.id_cliente = p.id_cliente
  );

SELECT * FROM pedidos ORDER BY id_pedido;

-- =========================================================
-- 9) CAPÍTULO 8 — Retención: eliminar ventas antiguas respecto a la última venta por cliente
--    (Subquery correlacionada con MAX)
-- Historia:
--   “Por privacidad, se retienen solo 180 días desde la última compra del cliente.”
-- Nota:
--   Aquí solo borramos ventas de clientes válidos (para no ‘reventar’ con huérfanos).
-- =========================================================
DELETE FROM ventas v
WHERE v.id_cliente IN (SELECT id_cliente FROM clientes)
  AND v.fecha < (
    SELECT MAX(v2.fecha)
    FROM ventas v2
    WHERE v2.id_cliente = v.id_cliente
  ) - INTERVAL '180 days';

-- Resultado final: conteos y muestra
SELECT 'ventas_post_retencion' AS tabla, COUNT(*) AS n FROM ventas;
SELECT * FROM ventas ORDER BY id_cliente, fecha;

-- =========================================================
-- 10) EPÍLOGO — Mini checklist de performance (para practicar EXPLAIN)
-- =========================================================
-- 10.1) Índices recomendados para EXISTS/IN/joins lógicos
-- (Crea índices si vas a trabajar con grandes volúmenes)
-- CREATE INDEX idx_ventas_id_cliente  ON ventas(id_cliente);
-- CREATE INDEX idx_ventas_id_producto ON ventas(id_producto);
-- CREATE INDEX idx_pedidos_id_cliente ON pedidos(id_cliente);
-- CREATE INDEX idx_productos_categoria ON productos(categoria);

-- 10.2) Prueba de plan:
-- EXPLAIN (ANALYZE, BUFFERS)
-- SELECT c.id_cliente, c.nombre
-- FROM clientes c
-- WHERE EXISTS (SELECT 1 FROM ventas v WHERE v.id_cliente = c.id_cliente);
--
