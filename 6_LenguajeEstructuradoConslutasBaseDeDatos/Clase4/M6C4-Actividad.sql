-- CREACIÓN DE TABLAS

create table clientes (
	id_cliente serial primary key,
	nombre text not null,
	email text not null,
	estado text not null check (estado in ('Activo','Inactivo')));

create table empleados (
	id_empleado serial primary key,
	nombre text not null,
	sueldo numeric(10,2) not null check (sueldo > 0));

create table pedidos (
	id_pedido serial primary key,
	id_cliente int not null,
	estado text not null check (estado in ('Completado','Cancelado')),
	fecha_pedido date not null default current_date);

create table productos (
	id_producto serial primary key,
	nombre text not null,
	categoria text not null check (categoria in ('Deportes','Hogar','Tecnologia','Vestuario')),
	precio numeric(10,2) not null check (precio > 0),
	stock int not null default 0 check (stock >= 0));

create table ventas (
	id_ventas serial primary key,
	id_pedido int not null,
	id_producto int not null,
	cantidad int not null,
	precio_unitario int not null,
	total_venta int not null);

-- VERIFICACIÓN IMPORTE DE DATOS

select * from clientes;
select * from empleados;
select * from pedidos;
select * from productos;
select * from ventas;


-- 01 CONSULTA CORRELACIONADA
-- Recupera productos cuyo precio es mayor al promedio de su categoría

select p.id_producto, p.nombre, p.categoria, p.precio, 
	(select round(avg(p2.precio),2) from productos p2 where p2.categoria = p.categoria) as avg_categoria
from productos p
where p.precio >
	(select avg(p2.precio) from productos p2 where p2.categoria = p.categoria)
order by p.categoria, p.precio desc;


-- 02 INSERT CON SUBQUERY ESCALAR
-- Inserta en una tabla de auditoría los empleados cuyo sueldo supere el percentil 90 de la empresa

create table auditoria_empleados (
	id_auditoria serial primary key,
	id_empleado int not null,
	nombre text not null,
	sueldo numeric(10,2) not null,
	marca text not null,
	ts timestamp not null default now());

insert into auditoria_empleados (id_empleado, nombre, sueldo, marca)
select e.id_empleado, e.nombre, e.sueldo, 'p90_sueldo'
from empleados e
where e.sueldo > (select percentile_cont(0.9) within group (order by sueldo) from empleados);

select * from auditoria_empleados order by ts desc, id_auditoria desc;


-- 03 UPDATE CON SUBQUERY TABULAR
-- Reduce en 10% el stock de productos con ventas totales superiores al promedio general de ventas

update productos 
set stock = round(stock * 0.90)::int
where id_producto in (
	select id_producto from ventas where id_producto in (select id_producto from productos)
	group by id_producto
	having sum(cantidad) > 
		(select avg(total_venta) from (
			select sum(cantidad) as total_venta from ventas where id_producto in (
				select id_producto from productos)
			group by id_producto
			)
		v)
);

select p.id_producto, p.nombre, p.stock from productos p order by p.id_producto;


-- DELETE CON SUBQUERY NOT EXISTS
-- Elimina pedidos cancelados de clientes inexistentes en la tabla de clientes

delete from pedidos p where p.estado = 'Cancelado' and not exists (
	select 1 from clientes c where c.id_cliente = p.id_cliente);

select * from pedidos order by id_pedido;


-- REFFLEXIÓN FINAL
-- Documenta un párrafo cuándo elegirías subqueries frente a joins en proyectos reales de datos

-- R: Usaría subqueries cuando necesitas filtrar con un cálculo derivado (como un promedio o percentil) 
-- y joins cuando quiera combinar datos de varias tablas para enriquecer resultados.
