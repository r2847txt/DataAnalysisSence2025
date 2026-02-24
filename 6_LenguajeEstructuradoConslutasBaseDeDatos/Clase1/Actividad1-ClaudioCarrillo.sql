-- CREACIÓN DE TABLAS

CREATE TABLE clientes(
	id_cliente SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(100) UNIQUE,
	fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE productos (
	id_producto SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	precio NUMERIC(10,2) CHECK (precio > 0)
);

CREATE TABLE pedidos (
	id_pedido SERIAL PRIMARY KEY,
	id_cliente INT REFERENCES clientes(id_cliente),
	fecha DATE DEFAULT CURRENT_DATE,
	monto NUMERIC(10,2)
);

-- INSERSIÓN DE REGISTROS

INSERT INTO clientes (nombre, correo) VALUES
	('Ana Torres', 'ana@mail.com'),
	('Luis Pérez', 'luis@mail.com');

SELECT * FROM clientes;


INSERT INTO productos (nombre, precio) VALUES
	('Teclado', 20000),
	('Mouse', 10000),
	('Monitor', 120000);

SELECT * FROM productos;


INSERT INTO pedidos (id_cliente, fecha, monto) VALUES
	(1, '2024-09-01', 140000),
	(2, '2024-09-02', 10000);

SELECT * FROM pedidos;


-- CONSULTA ANALITICA

SELECT c.nombre, SUM(p.monto) AS total_compras FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre;

-- EL CLIENTE QUE MÁS COMPRÓ FUE ANA TORRES CON UN TOTAL DE 140000.-