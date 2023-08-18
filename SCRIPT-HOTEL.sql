#crear base de datos db_hotel
create database db_hotel;
#usar base de datos
use db_hotel;
#borrar base de datos
drop database db_hotel;


#crear tabla de habitacion
create table habitacion(
	id_habitacion int primary key not null,
    nom_camas varchar (100) not null,
    tipo_habitacion varchar (100) not null
);

alter table habitacion add column id_reserva int not null;
alter table habitacion add foreign key (id_reserva) references reserva(id_reserva);

#crear tabla de reserva
create table reserva(
	id_reserva int primary key not null,
    tipo_reserva varchar(100),
    fecha_inicio varchar(10),
    fecha_fin varchar(10),
    id_huesped int not null,
    id_habitacion int not null,
    id_servicios int not null,
    estado varchar(100),
    foreign key (id_huesped) references huesped(id_huesped),
    foreign key (id_habitacion) references habitacion(id_habitacion),
    foreign key (id_servicios) references servicios(id_servicios)
);


#crear tabla de huesped
create table huesped(
	id_huesped int primary key not null,
    primer_nombre varchar (100),
    segundo_nombre varchar (100),
    primer_apellido varchar (100),
    segundo_apellido varchar (100),
    email varchar (100),
    telefono_fijo varchar (100),
    celular varchar (10),
    direccion varchar (100),
    id_ciudad int not null,
    id_pais int not null,
    foreign key (id_ciudad)references ciudad(id_ciudad),
    foreign key (id_pais)references pais(id_pais)
);


#crear tabla de servicios
create table servicios(
	id_servicios int primary key not null,
    calidad varchar(100),
    disponibilidad varchar (100),
    personalizacion varchar (100),
    conveniencia varchar (100),
    costo varchar (100)
);


#crear tabla de pais
create table pais(
	id_pais int primary key not null,
    nom_ciudad varchar (100) not null
);


#crear tabla de ciudad
create table ciudad(
	id_ciudad int primary key not null,
    nom_ciudad varchar (100) not null,
    id_departamento int not null,
    foreign key (id_departamento) references departamento(id_departamento)
);


#crear tabla de departamento
create table departamento(
	id_departamento int primary key not null,
    nom_departamento varchar (100) not null
);


show tables;