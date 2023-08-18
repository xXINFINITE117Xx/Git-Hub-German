# crear base de datos db_arriendos
create database db_arriendos;
#usar base de datos
use db_arriendos;
#borrar base de datos
drop database db_arriendos;


# crear, tabla departamento
create table departamento(
	id_departamento int primary key not null,
    nom_departamento varchar (100) not null
);

#crear tabla ciudad
create table ciudad(
	id_ciudad int primary key not null,
    nom_ciudad varchar (100) not null,
    cod_departamento int not null,
    foreign key (cod_departamento) references departamento(id_departamento)
);


#crear tabla vivienda
create table vivienda(
	id_vivienda int not null primary key,
    direccion varchar (100),
    cant_habitantes smallint,
    descripcion text,
    id_propietario int not null,
    cod_ciudad int not null,
    foreign key (cod_ciudad) references ciudad(id_ciudad),
    foreign key (id_propietario) references propietario(id_propietario)    
);


insert into vivienda(id_vivienda, direccion, cant_habitantes, descripcion, id_propietario, cod_ciudad) values (1, 'carrera 15 # 16-24', 4, 'casa grande de dos pisos', 1, 1);


#crear tabla propietario
create table propietario(
	id_propietario int not null primary key,
    primer_nombre varchar (100),
    segundo_nombre varchar (100),
    primer_apellido varchar (100),
    segundo_apellido varchar (100),
    telefono_fijo varchar (100),
    celular varchar (10),
    email varchar (100)
);

insert into propietario(id_propietario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values (1, 'Carlos', 'Andres', 'Portilla', 'Diaz', 6067348529, 3114459016, 'carlosandresportilladiaz@gmail.com');
insert into propietario(id_propietario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values (2, 'Jean', 'William', 'Sanchez', 'Escobar', 6067388928, 3166458123, 'jeanwilliansanchezescobar@gmail.com');
insert into propietario(id_propietario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values (3, 'Jose', 'Antonio', 'Borrega', 'Villegas', 6067304525, 3101145784, 'joseantonioborregavillegas@gmail.com');
insert into propietario(id_propietario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values (4, 'Daniela', 'Velazquez', 'Rojas', 'Londoño', 6067416020, 3206345475, 'danielavelazquezrojaslondoño@gmail.com');
insert into propietario(id_propietario, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values (5, 'Yeison', 'David', 'Castiblanco', 'Parra', 6067586123, 3145587936, 'yeisondavidcastiblancoparra@gmail.com');

# alterar campo celular
alter table propietario modify column celular int(10);
alter table propietario add column celular_segundo int(10);
alter table propietario drop column celular_segundo;
alter table propietario add constraint uk_email unique(email);


#crear tabla arriendos
create table arriendos(
	id_arriendo int primary key not null,
    f_inicio varchar (10),
    f_fin varchar (10),
    valor_mensual int not null,
    id_vivienda int not null,
    foreign key (id_vivienda) references vivienda (id_vivienda)
);

insert into arriendos(id_arriendo, f_inicio, f_fin, valor_mensual, id_vivienda) values (1, '10/08/2025', '10/29/2026', '$300.000', 4);

#crear tabla inquilino y arriendos (N:M)
create table arriendo_inquilinos(
	primary key(id_arriendo, id_inquilino),
    id_arriendo int not null,
    id_inquilino int not null,
    foreign key(id_arriendo) references arriendos(id_arriendo),
    foreign key(id_inquilino) references inquilino(id_inquilino)
);


#crear tabla inquilino
create table inquilino(
	id_inquilino int primary key not null,
	primer_nombre varchar (100),
    segundo_nombre varchar (100),
    primer_apellido varchar (100),
    segundo_apellido varchar (100),
    celular varchar (10)
);

insert into inquilino(id_inquilino, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, celular) values (1, 'Juan', 'David', 'Estrada', 'Moncada', 3117456316);

#comandos para visualizar tablas en la base de datos
SHOW TABLES;


SHOW DATABASES;


#visualizar composicion de la tabla
describe ciudad;
describe propietario;
describe departamento;


#insertar registros en las tablas creadas
insert into departamento(id_departmento, cod_departamento) values (1, 'Quindio', 1);
insert into ciudad(id_ciudad, nom_ciudad, cod_departamento) values (2, 'Tolima', 1), (3, 'Bogota', 1), (4, 'Cali' ,1), (5, 'Salento', 1);



insert into ciudad(id_ciudad, nom_ciudad, cod_departamento) values (1, 'Armenia', 1);
insert into ciudad(id_ciudad, nom_ciudad, cod_departamento) values (2, 'Calarca', 1), (3, 'Filandia', 1), (4, 'Buenavista', 1), (5, 'Montenegro', 1);


#mostrar registros en la tabla
select * from ciudad;
select * from departamento;
select * from propietario;
