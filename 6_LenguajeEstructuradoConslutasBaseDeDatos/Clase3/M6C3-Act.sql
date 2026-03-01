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

-- CONSULTA INICIAL
select * from empleados;

-- FILTRADO DE CONDICIONES
select * from 