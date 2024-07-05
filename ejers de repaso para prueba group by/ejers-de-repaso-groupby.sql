use ejercicios_de_repaso_groupby;

create table profesor(
dni int primary key,
nombre varchar(45),
apellido varchar(45),
direccion varchar(45),
telefono int,
añoingreso int
);
create table alumno(
dni int primary key,
nombre varchar(45),
apellido varchar(45),
direccion varchar(45),
telefono int,
añoingreso int
);
create table falta(
codigo int primary key,
fecha date,
justificada tinyint,
dni_alumno int,
foreign key (dni_alumno) references alumno(dni)
);
create table materia(
codigo int primary key,
nombre varchar(45),
cant_horas_semanales int,
dni_profesor int,
foreign key (dni_profesor) references profesor(dni)
);
create table alumno_has_materia (
dni_alumno int ,
codigo_materia int,
año int,
cant_faltas int,
trimestre_1 float,
trimestre_2 float,
trimestre_3 float,
primary key(dni_alumno, codigo_materia),
foreign key (dni_alumno) references alumno(dni),
foreign key (codigo_materia) references materia(codigo)
);

alter table alumno_has_materia add check(cant_faltas >=0);

-- Insert into profesor table
INSERT INTO profesor (dni, nombre, apellido, direccion, telefono, añoingreso) VALUES
(12345678, 'Juan', 'Perez', 'Calle Falsa 123', 123456789, 2015),
(87654321, 'Maria', 'Gomez', 'Avenida Siempre Viva 742', 987654321, 2018);

-- Insert into alumno table
INSERT INTO alumno (dni, nombre, apellido, direccion, telefono, añoingreso) VALUES
(23456789, 'Ana', 'Lopez', 'Calle Ejemplo 45', 234567890, 2020),
(34567890, 'Luis', 'Martinez', 'Avenida Ejemplo 67', 345678901, 2021);

-- Insert into falta table
INSERT INTO falta (codigo, fecha, justificada, dni_alumno) VALUES
(1, '2024-01-15', 0, 23456789),
(2, '2024-02-20', 1, 34567890);

-- Insert into materia table
INSERT INTO materia (codigo, nombre, cant_horas_semanales, dni_profesor) VALUES
(101, 'Matemáticas', 5, 12345678),
(102, 'Historia', 3, 87654321);

-- Insert into alumno_has_materia table
INSERT INTO alumno_has_materia (dni_alumno, codigo_materia, año, cant_faltas, trimestre_1, trimestre_2, trimestre_3) VALUES
(23456789, 101, 2024, 2, 7.5, 8.0, 9.0),
(34567890, 102, 2024, 0, 6.0, 7.5, 8.0);

-- empiezan los ejers

-- ejer 3
select count(dni_alumno) from alumno_has_materia join materia on materia.codigo=codigo_materia where trimestre_1>=6 and trimestre_2>=6 and trimestre_3>=6 and año=2024 and nombre='Matemáticas';
-- ejer 4
select nombre,apellido,dni from alumno join	alumno_has_materia on alumno.dni=dni_alumno where trimestre_1>=6 and trimestre_2>=6 and trimestre_3>=6 and año=2024 ;
-- ejer 5
select count(dni), añoingreso from profesor group by añoingreso;
-- ejer 6
select max(trimestre_3) from alumno_has_materia join materia on materia.codigo=codigo_materia where materia.nombre='Historia';
-- ejer 7
select count(dni) from alumno left join falta on alumno.dni=dni_alumno where dni_alumno is null;

-- comienza la tabla 2

create table pelicula(
codigo int primary key,
nombre varchar(45),
genero varchar(45),
fecha_estreno date
);
create table sala(
codigo int primary key,
capacidad int
);
create table butaca(
codigo int primary key,
letra char,
numero int
);
create table funcion(
codigo int primary key,
fecha date,
hora time,
precio_entrada float,
codigo_pelicula int,
codigo_sala int,
foreign key (codigo_pelicula) references pelicula(codigo),
foreign key (codigo_sala) references sala(codigo)
);
create table compra(
codigo int primary key,
fecha date,
dni_cliente int,
cant_entradas int,
codigo_funcion int,
foreign key (codigo_funcion) references funcion(codigo),
check(cant_entradas>0)
);
create table compra_has_butaca (
codigo_butaca int,
codigo_compra int,
primary key(codigo_butaca, codigo_compra),
foreign key (codigo_compra) references compra(codigo),
foreign key (codigo_butaca) references butaca(codigo)
);
-- Insert into pelicula table
INSERT INTO pelicula (codigo, nombre, genero, fecha_estreno) VALUES
(5, 'Inception', 'Sci-Fi', '2010-07-16'),
(6, 'The Dark Knight', 'Action', '2008-07-18');

-- Insert into sala table
INSERT INTO sala (codigo, capacidad) VALUES
(1, 200),
(2, 150);

-- Insert into butaca table
INSERT INTO butaca (codigo, letra, numero) VALUES
(1, 'A', 1),
(2, 'A', 2),
(3, 'B', 1),
(4, 'B', 2);

-- Insert into funcion table
INSERT INTO funcion (codigo, fecha, hora, precio_entrada, codigo_pelicula, codigo_sala) VALUES
(1, '2024-07-01', '18:30:00', 10.00, 1, 1),
(2, '2024-07-02', '20:00:00', 12.00, 2, 2);

-- Insert into compra table
INSERT INTO compra (codigo, fecha, dni_cliente, cant_entradas, codigo_funcion) VALUES
(1, '2024-07-01', 12345678, 2, 1),
(2, '2024-07-02', 87654321, 1, 2);

-- Insert into compra_has_butaca table
INSERT INTO compra_has_butaca (codigo_butaca, codigo_compra) VALUES
(1, 1),
(2, 1),
(3, 2);

-- comienzo ejercicio 2
-- ejer 3
select nombre,sum(precio_entrada) from pelicula join funcion on codigo_pelicula=pelicula.codigo where fecha_estreno like "2024-4-1" group by pelicula.codigo;
-- ejer 4
select nombre, avg(precio_entrada) from pelicula join funcion on codigo_pelicula=pelicula.codigo where fecha_estreno like "2024%";
-- ejer 5
select cant_entradas*precio_entrada from compra join funcion on codigo_funcion=funcion.codigo where funcion.fecha like "2024%"; 
-- ejer 6
select count(*) from compra group by dni_cliente having count(*)>10;
-- ejer 7
select max(capacidad) from sala;
