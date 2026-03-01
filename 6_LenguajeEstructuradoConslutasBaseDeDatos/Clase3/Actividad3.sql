
-- CREAR TABLAS
create table empleados (
	id_empleado serial primary key,
	nombre varchar(100) not null,
	departamento varchar(100) not null,
	salario numeric (10,2) not null check (salario > 0));

create table clientes (
	id_cliente serial primary key,
	nombre varchar(100) not null,
	pais varchar(100) not null,
	pedidos numeric(10,2) not null check (pedidos >= 0));

create table productos (
	id_producto SERIAL primary key,
	nombre_producto varchar(100) not null,
	precio numeric (10,2) not null check (precio > 0));

-- VERIFICAR IMPORTE CSV
select * from empleados;
select * from clientes;
select * from productos;

-- FILTRADO CON CONDICIONES
select id_empleado, nombre from empleados where departamento = 'Ventas' and salario > 1500000;

-- USO DE OPERADORES CONDICIONALES
select * from productos where precio between 100 and 500;

-- FUNCIONES DE AGREGACIÓN Y AGRUPACIÓN
select departamento, round(avg(salario)) as promedio_salario from empleados group by departamento order by promedio_salario;

-- CONDICIONES SOBRE AGREGACIÓN
select departamento, round(avg(salario)) as promedio_salario from empleados group by departamento having avg(salario) > 2500000 order by promedio_salario;

-- APLICACIÓN EN CONTEXTO REAL
select pais, count(pais) as clientes_activos from clientes group by pais having count(pais) > 5 order by clientes_activos desc;