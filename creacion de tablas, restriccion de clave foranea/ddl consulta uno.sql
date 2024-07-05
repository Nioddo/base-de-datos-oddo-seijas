create database ddl_consultas1;
use ddl_consultas1;

create table clientes (
dni int primary key,
nombre varchar(45),
apellido varchar(45),
edad int
);
create table proveedor(
cuit int primary key,
direccion varchar(45),
nombre varchar(45)
);
create table producto (
coidgo int primary key,
nomber varchar(45),
precios float,
provedor_cuit int,
foreign key (provedor_cuit) references proveedor(cuit)
on delete cascade
on update set null
);
create table clientes_has_producto(
clientes_dni int ,
producto_codigo int ,
primary key (clientes_dni,producto_codigo),
foreign key (clientes_dni) references clientes(dni),
foreign key (producto_codigo) references producto(coidgo)
);

insert into clientes value (4341234, "juan", "rodriguez", 18);
insert into producto value (1231241, "camilo", 1234, 12313);
insert into proveedor value (12313, "lavallol", "lauty");
insert into clientes_has_producto value (4341234,1231241);

select * from producto;
update proveedor set cuit=1234;
delete from provedor;