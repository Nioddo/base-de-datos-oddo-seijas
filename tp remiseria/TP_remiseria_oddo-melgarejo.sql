
use TP_remiseria_oddo_melgarejo;
-- punto(2)
create table choferes (
id int primary key,
dni int,
apellido varchar(45),
nombre varchar (45),
direccion varchar(45),
telefono int
);

create table auto(
patente varchar(7) primary key,
modelo varchar(45)
);

create table tipo_cliente(
id int primary key,
tipo varchar(45)
);

create table cuenta_corriente(
id int primary key,
saldo int,
nombre_titular varchar(45)
);

create table clientes(
id int primary key,
dni int,
nombre varchar(45),
apellido varchar(45),
direccion varchar(45),
telefono int,
observaciones varchar(45),
id_cuenta_corriente int,
id_tipo_cliente int,
foreign key (id_cuenta_corriente) references cuenta_corriente(id),
foreign key (id_tipo_cliente) references tipo_cliente(id)
);

create table viaje(
id int primary key,
fecha date,
destino varchar(45),
hora_de_llegada time,
costo float,
-- punto(3)
check(costo>=0),
cuenta_corriente tinyint,
patente_auto varchar(7),
id_choferes int,
id_clientes int,
foreign key (patente_auto) references auto(patente),
foreign key (id_choferes) references choferes(id),
foreign key (id_clientes) references clientes(id)
);
-- comenzamos con los inserts
-- punto(7)
-- Insertar datos en la tabla choferes 
INSERT INTO choferes (id, dni, apellido, nombre, direccion, telefono) VALUES
(1, 12345678, 'Gonzalez', 'Juan', 'Calle Falsa 123', 123456789),
(2, 87654321, 'Perez', 'Maria', 'Avenida Siempre Viva 456', 987654321),
(3, 11223344, 'Lopez', 'Carlos', 'Calle Luna 789', 112233445),
(4, 44332211, 'Martinez', 'Ana', 'Calle Sol 101', 443322110),
(5, 55667788, 'Garcia', 'Luis', 'Avenida Estrellas 202', 556677889);

-- punto(6)
-- Insertar datos en la tabla auto
INSERT INTO auto (patente, modelo) VALUES
('ABC123', 'Toyota Corolla'),
('DEF456', 'Honda Civic'),
('GHI789', 'Ford Focus'),
('JKL012', 'Chevrolet Cruze'),
('MNO345', 'Volkswagen Golf');

-- Insertar datos en la tabla tipo_cliente
INSERT INTO tipo_cliente (id, tipo) VALUES
(1, 'Persona'),
(2, 'Empresa');

-- Insertar datos en la tabla cuenta_corriente
INSERT INTO cuenta_corriente (id, saldo, nombre_titular) VALUES
(1, 10000, 'Juan Perez'),
(2, 15000, 'Maria Gonzalez'),
(3, 20000, 'Carlos Lopez'),
(4, 25000, 'Ana Martinez'),
(5, 30000, 'Luis Garcia');

-- punto(4)
-- Insertar datos en la tabla clientes
INSERT INTO clientes (id, dni, nombre, apellido, direccion, telefono, observaciones, id_cuenta_corriente, id_tipo_cliente) VALUES
(1, 23456789, 'Andres', 'Fernandez', 'Calle Norte 10', 234567890, 'VIP', 1, 1),
(2, 34567890, 'Beatriz', 'Rodriguez', 'Avenida Sur 20', 345678901, 'Frecuente', 2, 1),
(3, 45678901, 'Carlos', 'Hernandez', 'Calle Este 30', 456789012, 'Nuevo', 3, 2),
(4, 56789012, 'Daniela', 'Diaz', 'Avenida Oeste 40', 567890123, 'VIP', 4, 2),
(5, 67890123, 'Esteban', 'Martinez', 'Calle Centro 50', 678901234, 'Regular', 5, 1);

-- punto(5)
-- Insertar datos en la tabla viaje
INSERT INTO viaje (id, fecha, destino, hora_de_llegada, costo, cuenta_corriente, patente_auto, id_choferes, id_clientes) VALUES
(1, '2024-07-01', 'Destino A', '10:00:00', 100.0, 1, 'ABC123', 1, 1),
(2, '2024-07-02', 'Destino B', '11:00:00', 200.0, 0, 'DEF456', 2, 2),
(3, '2024-07-03', 'Destino C', '12:00:00', 300.0, 1, 'GHI789', 3, 3),
(4, '2024-07-04', 'Destino D', '13:00:00', 400.0, 0, 'JKL012', 4, 4),
(5, '2024-07-05', 'Destino E', '14:00:00', 500.0, 1, 'MNO345', 5, 5),
(6, '2024-07-06', 'Destino F', '15:00:00', 600.0, 0, 'ABC123', 1, 1),
(7, '2024-07-07', 'Destino G', '16:00:00', 700.0, 1, 'DEF456', 2, 2),
(8, '2024-07-08', 'Destino H', '17:00:00', 800.0, 0, 'GHI789', 3, 3),
(9, '2024-07-09', 'Destino I', '18:00:00', 900.0, 1, 'JKL012', 4, 4),
(10, '2024-07-10', 'Destino J', '19:00:00', 1000.0, 0, 'MNO345', 5, 5);

-- punto (8)
delete from choferes where id=1; -- no se puede borrar debido a que otras tablas dependen de esta columna.

-- punto (9)
delete from viaje where id_clientes=3; -- este delete sí se puede hacer.

-- punto (10)
select count(patente) from auto;

-- punto (11)
select avg(costo) from viaje where id_clientes=4;

-- punto (12)
select max(costo) from viaje where id_clientes=3;

-- punto (13)
select nombre from clientes where nombre like "A%";

-- punto (14)
select id, fecha from viaje where fecha>= "2023-10-10" and fecha<= "2023-10-30"; 

-- punto(15)
select if(saldo<0, saldo, "no debe nada") from cuenta_corriente join clientes on cuenta_corriente.id=id_cuenta_corriente where clientes.id=5;

-- punto(16)
select id_choferes,count(id) from viaje group by id_choferes;

-- punto(17)
select costo*1.21 from viaje;

-- punto(18)
select max(costo) from viaje;

-- punto(19)
select min(costo) from viaje;

-- punto(20)
select fecha,id_choferes,count(id) from viaje group by id_choferes, fecha;

-- punto(21)
select count(id) from viaje group by id_clientes having count(id)>5;

-- punto(22)
select clientes.id, if(saldo<=0, saldo, "No debe nada") from clientes join tipo_cliente on id_tipo_cliente=tipo_cliente.id join cuenta_corriente on id_cuenta_corriente=cuenta_corriente.id where tipo="Empresa";

 -- punto(23)
select destino, patente, modelo , nombre, apellido, costo from auto join viaje on patente_auto=patente join choferes on id_choferes=choferes.id where choferes.id=4;
-- agregamos mostrar destino para diferenciar los viajes

-- punto(24)
select clientes.id, nombre, apellido, count(viaje.id) from clientes join viaje on id_clientes=clientes.id where fecha like "2023-%" group by (clientes.id);

-- punto(25)
select id_choferes, count(id), sum(costo),sum(costo)*0.18 as "comisión" from viaje group by id_choferes;