insert into cliente value (1, "camila", "magdalena", "holmberg", 653656321);
insert into cliente value (2, "luana", "lage", "vallejos", 65474651);
insert into cliente value (3, "camilo", "gonzales", "llavallol", 848273482);
insert into cliente value (4, "agustina", "ogro", "manuel sarratea", 87367288);
insert into compra value (1, "2023-06-14", 1);
insert into compra value (2, "2022-10-19", 2);
insert into compra value (3, "2020-03-25", 3);
insert into compra value (4, "2017-01-21", 4);
insert into Producto value (1, 674, 95, "libro");
insert into Producto value (2, 1500, 35, "control play");
insert into Producto value (3, 200, 143, "hojas");
insert into Producto value (4, 800, 50, "pack de bebidas");
insert into proveedores value (1, "corral", "jorge", "rial", "cordoba", 8747823, 1);
insert into proveedores value (2, "central", "manuel", "perez", "capital", 46282221, 2);
insert into proveedores value (3, "el papu", "cristian", "uribe", "provincia", 93472678, 3);
insert into proveedores value (4, "felipe bebidas", "luciano", "lencina", "entre rios", 49362876, 4);

select descripcion, precio from Producto where precio>1000 order by precio desc;
select nombre from cliente where apellido like "p%";
delete from Producto where descripcion="";
select Producto where codigo=7 from proveedores;

