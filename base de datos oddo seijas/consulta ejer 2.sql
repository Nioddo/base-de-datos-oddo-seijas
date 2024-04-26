insert into Camion value ("AA999KK", "Juan", "Grande", "500hp");
insert into Camionero value (2577, "Mucha", "Alejandro", 5465, "Urquiza", 105,"AA999KK", "2023-05-02");
insert into ciudad value (1431, "Buenos Aires");
insert into paquete value (87, "pesado", "Niclex", "Sarratea 2964", "1431", 2577);

select * from Camionero where fecha_de_manejo = "2023-05-02";
select nombre from ciudad;
update Camionero set salario = salario * 0.1;
select Codigo, descripcion, Camionero_rec from paquete;
delete from paquete where Codigo<100