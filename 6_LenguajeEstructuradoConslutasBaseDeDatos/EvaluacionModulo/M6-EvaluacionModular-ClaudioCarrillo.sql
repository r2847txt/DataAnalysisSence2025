-- PARTE 1 CREACIÓN DE BASE DE DATOS
create database ventas_online;

-- PARTE 2 CREACIÓN DE TABLAS
create table Cliente (
	id_cliente serial primary key,
	nombre varchar(100) not null,
	email varchar(100) not null unique,
	ciudad varchar(50));

create table Producto (
	id_producto serial primary key,
	nombre varchar(100) not null,
	categoria varchar(50),
	precio numeric(10,2) not null check (precio > 0));

create table Pedido (
	id_pedido serial primary key,
	fecha_pedido date not null,
	id_cliente int not null,
	foreign key (id_cliente) references Cliente(id_cliente));

create table Detalle_Pedido (
	id_detalle serial primary key,
	id_pedido int not null,
	id_producto int not null,
	foreign key (id_pedido) references Pedido(id_pedido),
	foreign key (id_producto) references Producto(id_producto),
	cantidad int not null check (cantidad > 0));

-- PARTE 3 INSERCIÓN DE DATOS
/*
insert into Cliente (nombre, email, ciudad) values 
	('Claudio','claudio@cmail.com','Puerto Natales'),
	('Giovanni','giovanni@cmail.com','Curicó'),
	('Juan','juan@cmail.com','Iquique');

select * from Cliente;

insert into Producto (nombre, categoria, precio) values
	('Teclado MK','Accesorios', 49000),
	('Mouse','Accesorios', 16990),
	('Monitor UW','Pantallas',199990),
	('Monitor GR','Pantallas',135990);

select * from Producto;

insert into Pedido (fecha_pedido, id_cliente) values
	('2026-03-06',1),
	('2026-03-07',2),
	('2026-03-08',3);

select * from Pedido;

insert into Detalle_Pedido (id_pedido, id_producto, cantidad) values 
	(1,2,1),
	(2,3,1),
	(3,4,2);

select * from Detalle_Pedido;
*/

-- Verificar carga de datos

select * from Cliente;
select * from Producto;
select * from Pedido;
select * from Detalle_Pedido;

-- PARTE 4 CONSULTAS SQL REQUERIDAS

-- 01 Obtener todos los clientes y sus pedidos (aunque no tengan pedido)
select c.id_cliente, c.nombre, p.id_pedido, p.fecha_pedido from Cliente c 
left join Pedido p on c.id_cliente = p.id_cliente
order by c.id_cliente;

-- 02 Listar los productos vendidos con su cantidad total vendida
select p.id_producto, p.nombre, sum(dp.cantidad) as total
from Producto p 
join Detalle_Pedido dp on p.id_producto = dp.id_producto 
group by p.id_producto, p.nombre 
order by total desc;

-- 03 Calcular el monto total de cada pedido
select p.id_pedido, sum(dp.cantidad * pr.precio) as monto_total from Pedido p
join Detalle_Pedido dp on p.id_pedido = dp.id_pedido
join Producto pr on dp.id_producto = pr.id_producto
group by p.id_pedido
order by p.id_pedido;

-- 04 Obtener el cliente que ha gastado más dinero
select c.id_cliente, c.nombre, sum(dp.cantidad * pr.precio) as total_gastado from Cliente c
join Pedido p on c.id_cliente = p.id_cliente
join Detalle_Pedido dp on p.id_pedido = dp.id_pedido
join Producto pr on dp.id_producto = pr.id_producto
group by c.id_cliente
order by total_gastado desc
limit 1;

-- 05 Contar la cantidad de pedidos realizados por cada cliente
select c.id_cliente, c.nombre, count(p.id_cliente) as cantidad_pedidos from Cliente c
left join Pedido p on c.id_cliente = p.id_cliente
group by c.id_cliente
order by cantidad_pedidos desc;

-- 06 Obtener los productos cuyo precio sea mayor al precio promedio (subquery)
select id_producto, nombre, precio from Producto 
where precio > (select avg(precio) from Producto)
order by precio desc;

-- 07 Listar pedidos realizados en una fecha específica (2025-03-15)
select p.id_pedido, p.fecha_pedido, c.nombre from Pedido p
join Cliente c on p.id_cliente = c.id_cliente
where p.fecha_pedido = '2025-03-15';

-- PARTE 5 MANIPULACIÓN DE DATOS

-- 01 Actualizar el precio de un producto especifico (precio de 1 = 28980)
-- select * from Producto;
update Producto set precio = 30000 where id_producto = 1;

-- 02 Eliminar un pedido (y sus detalles asociados, respetando integridad referencial)
-- select * from Pedido order by id_pedido asc;
-- select * from Detalle_Pedido order by id_pedido asc;
delete from Detalle_Pedido where id_pedido = 1;
delete from Pedido where id_pedido = 1;

-- PARTE 6 FONCIÓN DEFINIDA POR USUARIO
-- Crear una función SQL que reciba un id_cliente y retorne el monto total gastado por ese cliente

/*
select * from Cliente where id_cliente = 1;
select * from Pedido where id_cliente = 1; -- id_pedido in (86, 128)
select * from Detalle_Pedido where id_pedido in (86,128) order by id_producto;
select * from producto where id_producto in (7,11,20,21,25,29,33);
 */

create function total_gastado_cliente (p_id_cliente int)
returns numeric
as $$
	select coalesce(sum(dp.cantidad * pr.precio),0)
	from Pedido p
	join Detalle_Pedido dp on p.id_pedido = dp.id_pedido
	join Producto pr on dp.id_producto = pr.id_producto
	where p.id_cliente = $1;
$$ language sql;

select total_gastado_cliente(1);




