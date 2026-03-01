/* =========================================================
   CLASE 3
   ========================================================= */

-- SELECT current_database();
-- DROP TABLE IF EXISTS pacientes;


CREATE TABLE empleados ( 
id_empleado SERIAL PRIMARY KEY, 
nombre VARCHAR(80) NOT NULL, 
departamento VARCHAR(40) NOT NULL, 
salario INTEGER NOT NULL CHECK (salario > 0) ); 

CREATE TABLE clientes ( 
id_cliente SERIAL PRIMARY KEY, 
nombre VARCHAR(80) NOT NULL, 
pais VARCHAR(50) NOT NULL, 
pedidos INTEGER NOT NULL DEFAULT 0 CHECK (pedidos >= 0) ); 

CREATE TABLE productos ( 
id_producto SERIAL PRIMARY KEY, 
nombre_producto VARCHAR(100) NOT NULL, 
precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0) ); 

CREATE TABLE pacientes ( 
id_paciente SERIAL PRIMARY KEY, 
nombre_paciente VARCHAR(80) NOT NULL, 
especialidad VARCHAR(60) NOT NULL, 
dias_hospitalizacion INTEGER NOT NULL CHECK (dias_hospitalizacion >= 0) );

/* ---- Inserts EXTRA: EMPLEADOS ---- */
INSERT INTO empleados (nombre, departamento, salario) VALUES
('Bárbara',   'Ventas',      1850000),
('Benjamín',  'Ventas',      2750000),
('Cecilia',   'RRHH',        2100000),
('Cristóbal', 'RRHH',        1550000),
('Damián',    'IT',          4100000),
('Dominga',   'IT',          2850000),
('Emilia',    'Marketing',   1950000),
('Esteban',   'Marketing',   2450000),
('Francisca', 'Ventas',      990000),
('Fernando',  'Ventas',      1350000),
('Gabriela',  'IT',          3200000),
('Gonzalo',   'IT',          1750000),
('Ignacia',   'RRHH',        2050000),
('Ignacio',   'RRHH',        1650000),
('Josefa',    'Marketing',   1550000),
('Joaquín',   'Marketing',   2050000),
('Karla',     'Ventas',      2250000),
('Kevin',     'Ventas',      1450000),
('Laura',     'IT',          2650000),
('Lucas',     'IT',          2350000),
('Magdalena', 'RRHH',        1800000),
('Martín',    'RRHH',        1950000),
('Nicolás',   'Marketing',   1750000),
('Noelia',    'Marketing',   2300000),
('Olivia',    'Ventas',      3100000),
('Óscar',     'Ventas',      2050000),
('Pamela',    'IT',          1900000),
('Pablo',     'IT',          2150000),
('Rocío',     'RRHH',        2600000),
('Renato',    'RRHH',        1400000),
('Sergio',    'Marketing',   2700000),
('Sebastián', 'Marketing',   1500000),
('Valentina', 'Ventas',      1600000),
('Vicente',   'Ventas',      2950000),
('Ximena',    'IT',          3600000),
('Yasna',     'RRHH',        1750000),
('Zoe',       'Marketing',   2100000);


/* ---- Inserts EXTRA: CLIENTES ---- */
INSERT INTO clientes (nombre, pais, pedidos) VALUES
('Antonia',     'Chile',        0),
('Bruno',       'Chile',        5),
('Catalina',    'Chile',        9),
('Cristian',    'Chile',        1),
('Daniel',      'Perú',         4),
('Diana',       'Perú',         11),
('Ema',         'Argentina',    2),
('Enrique',     'Argentina',    7),
('Fernanda',    'México',       3),
('Fabián',      'México',       10),
('Giselle',     'Colombia',     6),
('Hugo',        'Colombia',     0),
('Inés',        'Uruguay',      8),
('Iván',        'Uruguay',      1),
('Jorge',       'España',       4),
('Josefina',    'España',       9),
('Katherine',   'Chile',        14),
('Karim',       'Chile',        2),
('Lina',        'Perú',         5),
('Luis',        'Perú',         12),
('Mariana',     'México',       0),
('Matías',      'Chile',        6),
('Nerea',       'España',       3),
('Néstor',      'Argentina',    10),
('Paula',       'Chile',        7),
('Pedro',       'Colombia',     2),
('Santiago',    'Chile',        11),
('Sabrina',     'Uruguay',      6),
('Tamara',      'Chile',        4),
('Tomás A.',    'Chile',        13),
('Valeria',     'Perú',         9),
('Víctor',      'México',       1),
('Wendy',       'Colombia',     5),
('Yamil',       'Argentina',    0),
('Zahira',      'España',       12);


/* ---- Inserts EXTRA: PRODUCTOS ---- */
INSERT INTO productos (nombre_producto, precio) VALUES
('Audífonos Bluetooth',        75.00),
('Webcam HD',                  55.00),
('Disco SSD 1TB',             130.00),
('Disco HDD 2TB',             110.00),
('Router WiFi 6',             160.00),
('Cable HDMI 2m',              12.00),
('Mousepad XL',                18.00),
('Notebook Stand',             25.00),
('Micrófono USB',              95.00),
('Impresora',                 220.00),
('Tóner',                      40.00),
('Lámpara LED Escritorio',     22.00),
('Hub USB-C',                  28.00),
('Batería Externa 20.000mAh',  38.00),
('Tablet 10"',                210.00),
('Smartwatch',                140.00),
('Licencia Antivirus',         30.00),
('Teclado Inalámbrico',        45.00),
('Silla Gamer',               390.00),
('Escritorio',                499.99);


/* ---- Inserts EXTRA: PACIENTES ---- */
INSERT INTO pacientes (nombre_paciente, especialidad, dias_hospitalizacion) VALUES
('Camilo Muñoz',        'Cardiología',     2),
('Carla Medina',        'Cardiología',    11),
('Carmen Díaz',         'Pediatría',       1),
('Claudia Araya',       'Pediatría',       6),
('Diego Herrera',       'Traumatología',   4),
('Daniel Pino',         'Traumatología',  18),
('Elisa Campos',        'Neurología',      9),
('Estela Garrido',      'Neurología',     14),
('Felipe Jara',         'Oncología',      21),
('Francisco Lagos',     'Oncología',       7),
('Gabriel Contreras',   'Medicina Interna',5),
('Germán Fuentes',      'Medicina Interna',12),
('Héctor Navarrete',    'Gastroenterología',3),
('Ingrid Salas',        'Gastroenterología',8),
('Javiera Molina',      'Cardiología',     0),
('Jorge Valdés',        'Traumatología',  15),
('Karina Soto',         'Pediatría',       2),
('Luis Zamora',         'Neurología',      4),
('Mariana Rivas',       'Oncología',      10),
('Matilde Sepúlveda',   'Medicina Interna',1),
('Nicolás Riquelme',    'Traumatología',   6),
('Paola Cisternas',     'Cardiología',    13),
('Patricio Vera',       'Gastroenterología',16),
('Sofía Bustos',        'Pediatría',       9),
('Tomás Venegas',       'Neurología',     20),
('Valentina Orellana',  'Oncología',      25),
('Víctor Olivares',     'Medicina Interna',0),
('Ximena Aguilera',     'Cardiología',     7),
('Yasna Carrasco',      'Traumatología',  10),
('Zulema Lillo',        'Gastroenterología',0);


/* 1.1 Traer todo */
SELECT *
FROM empleados
limit 10;

/* 1.2 Columnas específicas + orden */
SELECT nombre, departamento, salario
FROM empleados
ORDER BY salario DESC;



/* =========================================================
   2) WHERE (FILTROS)
   ========================================================= */

/* 2.1 Salario mayor a 2.500.000 */
SELECT nombre, salario
FROM empleados
WHERE salario > 2500000
ORDER BY salario DESC;

/* 2.2 Ventas y salario mayor a 2.000.000 */
SELECT nombre, departamento, salario
FROM empleados
WHERE departamento = 'Ventas'
  AND salario > 2000000
ORDER BY salario DESC;



/* =========================================================
   3) BETWEEN / LIKE / IN
   ========================================================= */

/* 3.1 BETWEEN */
SELECT nombre, salario
FROM empleados
WHERE salario BETWEEN 1500000 AND 2500000
ORDER BY salario;

/* 3.2 LIKE */
SELECT nombre
FROM empleados
WHERE nombre LIKE 'A%'
   OR nombre LIKE 'M%'
ORDER BY nombre;

/* 3.3 IN */
SELECT nombre, departamento, salario
FROM empleados
WHERE departamento IN ('Ventas', 'IT')
ORDER BY departamento, salario DESC;



/* =========================================================
   4) AND / OR
   ========================================================= */

SELECT nombre, departamento, salario
FROM empleados
WHERE (departamento = 'Ventas' AND salario > 2600000)
   OR (departamento = 'RRHH'  AND salario > 2000000)
ORDER BY departamento, salario DESC;



/* =========================================================
   5) AGREGACIONES
   ========================================================= */

/* 5.1 MIN / MAX / AVG */
SELECT
  MIN(salario) AS salario_minimo,
  MAX(salario) AS salario_maximo,
  ROUND(AVG(salario)) AS salario_promedio
FROM empleados;

/* 5.2 COUNT por departamento */
SELECT departamento, COUNT(*) AS total_empleados
FROM empleados
GROUP BY departamento
ORDER BY total_empleados DESC, departamento;



/* =========================================================
   6) GROUP BY + HAVING
   ========================================================= */

/* 6.1 Cantidad por departamento */
SELECT departamento, COUNT(*) AS total
FROM empleados
GROUP BY departamento
ORDER BY total DESC;

/* 6.2 HAVING */
SELECT departamento, COUNT(*) AS total
FROM empleados
GROUP BY departamento
HAVING COUNT(*) >= 10
ORDER BY total DESC;



/* =========================================================
   7) CLIENTES / PRODUCTOS / PACIENTES
   ========================================================= */

/* 7.1 Clientes */
SELECT *
FROM clientes
ORDER BY pais, pedidos DESC, nombre;

/* 7.2 Clientes de Chile con más de 7 pedidos */
SELECT nombre, pais, pedidos
FROM clientes
WHERE pais = 'Chile' AND pedidos > 7
ORDER BY pedidos DESC;

/* 7.3 Productos entre 50 y 250 */
SELECT nombre_producto, precio
FROM productos
WHERE precio BETWEEN 50 AND 250
ORDER BY precio;

/* 7.4 Salario promedio por departamento */
SELECT departamento, ROUND(AVG(salario)) AS promedio
FROM empleados
GROUP BY departamento
ORDER BY promedio DESC;

/* 7.5 Departamentos con promedio > 2.300.000 */
SELECT departamento, ROUND(AVG(salario)) AS promedio
FROM empleados
GROUP BY departamento
HAVING AVG(salario) > 2300000
ORDER BY promedio DESC;

/* 7.6 Pacientes críticos */
SELECT nombre_paciente, especialidad, dias_hospitalizacion
FROM pacientes
WHERE (especialidad = 'Cardiología'   AND dias_hospitalizacion > 12)
   OR (especialidad = 'Traumatología' AND dias_hospitalizacion > 15)
ORDER BY especialidad, dias_hospitalizacion DESC;



/* =========================================================
   8) ANÁLISIS EXTRA
   ========================================================= */

/* 8.1 Clientes por país */
SELECT pais,
       COUNT(*) AS total_clientes,
       ROUND(AVG(pedidos), 2) AS pedidos_promedio
FROM clientes
GROUP BY pais
HAVING COUNT(*) >= 2
ORDER BY total_clientes DESC;

/* 8.2 Promedio días hospitalización por especialidad */
SELECT especialidad,
       COUNT(*) AS total_pacientes,
       ROUND(AVG(dias_hospitalizacion), 2) AS dias_promedio,
       MAX(dias_hospitalizacion) AS max_dias
FROM pacientes
GROUP BY especialidad
HAVING COUNT(*) >= 3
ORDER BY dias_promedio DESC;