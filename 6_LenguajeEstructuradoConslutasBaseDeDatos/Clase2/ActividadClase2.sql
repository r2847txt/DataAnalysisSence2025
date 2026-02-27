
-- CREAR TABLAS
create table productos (
	id_producto SERIAL primary key,
	precio numeric (10,2) not null,
	nombre varchar(100) not null check (precio > 0),
	stock int default 0);

create table ventas (
	id_ventas serial primary key,
	id_producto int references productos(id_producto),
	cantidad int check (cantidad > 0),
	fecha timestamp default current_timestamp);

-- INSERTAR REGISTROS MANUALES
insert into productos (nombre, precio, stock) values 
	('Laptop',750000, 10),
	('Mouse', 12000, 50);

-- validación
select * from productos;
select count(*) from productos;

-- ACTUALIZACIÓN STOCK
update productos set stock = stock - 2 where id_producto = 1;

select stock from productos where id_producto = 1;

-- ELIMINAR DE FORMA SEGURA
delete from productos where id_producto = 2;

-- CONSULTA VALIDACIÓN JOIN
insert into ventas (id_producto, cantidad) values (1,2);
select p.nombre, v.cantidad, v.fecha from ventas v join productos p on v.id_producto = p.id_producto;

