# crear base de datos db_biblioteca
create database db_biblioteca;
#usar biblioteca
use db_biblioteca;
#borrar base de datos
drop database db_biblioteca;



#crear tabla de informe
create table informe(
	id_informe int primary key not null,
    prestamos_realizados varchar(100),
    libros_disponibles varchar(100),
    titulo varchar(100),
    autor varchar(100)
);


insert into informe(id_informe, prestamos_realizados, libros_disponibles, titulo, autor) values (1, 14, 6, 'Black Cat', 'Oppenhaimer');
insert into informe(id_informe, prestamos_realizados, libros_disponibles, titulo, autor) values (2, 20, 4, 'La Pata Sola', 'Borrego');
insert into informe(id_informe, prestamos_realizados, libros_disponibles, titulo, autor) values (3, 18, 12, 'Cien Años De Soledad', 'Gabriel');
insert into informe(id_informe, prestamos_realizados, libros_disponibles, titulo, autor) values (4, 30, 20, 'Por Que Le Pasan Las Cosas Malas A La Gente', 'Henry');
insert into informe(id_informe, prestamos_realizados, libros_disponibles, titulo, autor) values (5, 6, 3, 'La Vida De Un Critico', 'Sancho Panza');



#crear tabla del personal
create table personal(
	id_personal int primary key not null,
    primer_nombre varchar (100),
    segundo_nombre varchar (100),
    primer_apellido varchar (100),
    segundo_apellido varchar (100),
    id_informe int not null,
    foreign key (id_informe) references informe(id_informe)
);

insert into personal (id_personal, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_informe) values (1, 'Juliana', 'Violeta', 'Aguirre', 'Giraldo', 1);
insert into personal (id_personal, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_informe) values (2, 'Jorge', 'Andres', 'Palacio', 'Echeverry', 2);
insert into personal (id_personal, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_informe) values (3, 'Mateo', 'David', 'Velazquez', 'Rojas', 3);
insert into personal (id_personal, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_informe) values (4, 'Juan', 'Esteban', 'Gaona', 'Henao', 4);
insert into personal (id_personal, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_informe) values (5, 'Juan', 'Esteban', 'Soto', 'Molina', 5);



#crear tabla de libro
create table libro(
	id_libro int primary key not null,
    titulo varchar (100),
    autor varchar (100),
    genero_libro varchar (100),
    id_usuario int not null,
    id_prestamo int not null,
    foreign key (id_prestamo) references prestamo(id_prestamo),
    foreign key (id_usuario) references usuario(id_usuario)
);

insert into libro(id_libro, titulo, autor, genero_libro, id_usuario, id_prestamo) values (1, 'Blact Cat', 'Oppenhaimer', 'Teoria', 1, 1);
insert into libro(id_libro, titulo, autor, genero_libro, id_usuario, id_prestamo) values (2, 'La Pata Sola', 'Borrego', 'Terror', 2, 2);
insert into libro(id_libro, titulo, autor, genero_libro, id_usuario, id_prestamo) values (3, 'Cien Años De Soledad', 'Gabril', 'Realismo Magico', 3, 3);
insert into libro(id_libro, titulo, autor, genero_libro, id_usuario, id_prestamo) values (4, 'Por Que Le Pasan Las Cosas Malas A La Gente', 'Henry', 'Teoria', 4, 4);
insert into libro(id_libro, titulo, autor, genero_libro, id_usuario, id_prestamo) values (5, 'La Vida De Un Critico', 'Sancho Panza', 'Critica', 5, 5);



alter table libro modify column titulo varchar(100);
alter table libro modify column autor varchar(100);


#crear tabla de prestamo
create table prestamo(
	id_prestamo int primary key not null,
    libro varchar (100),
    usuario varchar (100),
    fecha_inicio varchar (10),
    fecha_fin varchar (10)
);

insert into prestamo (id_prestamo, libro, usuario, fecha_inicio, fecha_fin) values (1, 12, 'Benito Camelo', '20-08-2024', '20-09-2024');
insert into prestamo (id_prestamo, libro, usuario, fecha_inicio, fecha_fin) values (2, 4, 'Jhon 117', '23-04-2024', '21-05-2024');
insert into prestamo (id_prestamo, libro, usuario, fecha_inicio, fecha_fin) values (3, 8, 'Ghost', '12-11-2024', '14-12-2024');
insert into prestamo (id_prestamo, libro, usuario, fecha_inicio, fecha_fin) values (4, 20, 'Shadow', '15-07-2024', '18-08-2024');
insert into prestamo (id_prestamo, libro, usuario, fecha_inicio, fecha_fin) values (5, 16, 'Kennedy', '11-11-2024', '12-12-2024');

#crear tabla de usuario
create table usuario(
	id_usuario int primary key not null,
    primer_nombre varchar (100),
    segundo_nombre varchar (100),
    primer_apellido varchar (100),
    segundo_apellido varchar (100),
    realizar_prestamo varchar (100),
    buscar_libros_disponibles varchar (100)
);

insert into usuario(id_usuario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, realizar_prestamo, buscar_libros_disponibles) values (1, 'Alejandro', 'Arias', 'Monserrate', 'Lopez', 'SI', 40);
insert into usuario(id_usuario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, realizar_prestamo, buscar_libros_disponibles) values (2, 'Jhon', 'Diego', 'Rodrigo', 'Sanchez', 'SI', 20);
insert into usuario(id_usuario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, realizar_prestamo, buscar_libros_disponibles) values (3, 'Juan', 'Hernando', 'Echeverry', 'Giraldo', 'NO', 32);
insert into usuario(id_usuario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, realizar_prestamo, buscar_libros_disponibles) values (4, 'Julian', 'Armando', 'Villegas', 'Perez', 'NO', 21);
insert into usuario(id_usuario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, realizar_prestamo, buscar_libros_disponibles) values (5, 'Diego', 'Lopera', 'Aguirre', 'Gimenez', 'SI', 14);




show tables;


describe informe;


select * from informe;
select * from prestamo;
select * from usuario;
select * from libro;
select * from personal;