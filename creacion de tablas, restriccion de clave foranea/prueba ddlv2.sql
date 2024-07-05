
use claseDDL;

create table clientes (
dni int primary key,
telefono int,
celular int,
direccion varchar(45),
nombre varchar(45),
apellido varchar(45)
);

create table cabaña (
codigo int primary key,
cocina varchar(45),
garaje varchar(45),
parrilla varchar(45)
);

create table pago (
codigo int primary key,
tipo_de_pago varchar(45)
);

create table viaje (
codigo int primary key,
tipo_de_transporte varchar(45)
);

create table alojamientos (
codigo int primary key,
categoria varchar(45),
telefono int,
dirreccion varchar(45),
nombre varchar(45),
cdt_max_de_personas int,
bar_o_restaurante varchar(45),
cabaña_codigo int,
foreign key (cabaña_codigo) references cabaña(codigo)
on delete set null
on update restrict
);

create table paquete_de_viaje(
codigo int primary key,
lugar varchar(45),
cost float,
cdt_de_personas int,
cdt_de_excursiones int,
viaje_codigo int,
foreign key (viaje_codigo) references viaje(codigo)
on delete set null
on update cascade ,
alojamientos_codigo int,
foreign key (alojamientos_codigo) references alojamientos(codigo)
on delete restrict
on update restrict,
pago_codigo int,
foreign key (pago_codigo) references pago(codigo)
on delete set null
on update cascade
);
create table reservas (
codigo int primary key,
fecha_de_inicio date,
fecha_de_fin date,
cdt_de_personas int,
clientes_dni int,
foreign key (clientes_dni) references clientes(dni)
on delete restrict
on update restrict,
paquete_de_viaje_codigo int,
foreign key (paquete_de_viaje_codigo) references paquete_de_viaje(codigo)
on delete restrict
on update cascade
);
INSERT INTO clientes VALUES (12345678, 11223344, 99887766, 'Calle A #123', 'Juan', 'Garcia');
INSERT INTO cabaña VALUES (1, 'Equipada', 'Sí', 'Sí');
INSERT INTO viaje VALUES (1, 'Avión');
INSERT INTO pago VALUES (1, 'Tarjeta de crédito');
INSERT INTO alojamientos VALUES (1, 'Hotel', 12345678, 'Calle Principal #123', 'Hotel Plaza', 100, 'Restaurante',1);
INSERT INTO paquete_de_viaje VALUES (1, 'París', 1500.00, 7, 5, 1, 1, 1);
INSERT INTO reservas VALUES (1,'2024-06-01', '2024-06-05', 2,12345678,1);

select * from alojamientos;
update cabaña set codigo=121212121;
delete from cabaña;

select * from paquete_de_viaje;
update viaje set codigo=123123;

select * from reservas;
delete from clientes;

alter table reservas add column descuento float;

create table empleado (
fecha_de_nacimiento date,
nombre varchar(45),
apellido varchar(45),
dni int,
primary key (dni)
);
alter table reservas add column empleado int;
alter table reservas add foreign key (empleado) references empleado(dni);
