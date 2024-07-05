insert into Clientes value (4341234, "juan", "rodriguez", 18);
insert into Producto value (1231241, "camilo", 1234, 12313);
insert into Provedor value (12313, "lavallol", "lauty");

select Nombre, apellido from Clientes;
update Clientes set edad=18, apellido= "rodriguez" where Nombre="juan";
select Nombre, edad from Clientes where edad>=18;
select Codigo, Precio$, Provedor_CUIT from Producto;
update Clientes set dni=11111111;


