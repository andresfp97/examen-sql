create database negocio;

use negocio;
 create table cliente(
		id int primary key,
		nombre varchar (50) not null,
		celular varchar(50),
		direccion varchar(50)
 );

create table ingrediente(
id int primary key,
nombre varchar(50),
precio decimal(10,2)
);


create table producto (
	id int primary key,
	nombre varchar(50),
	tipo  enum ("pizza", "bebida") not null,
	tamanio enum ("pequeña", "mediana", "grande") not null,
	idIngrediente int not null,
	precio decimal (10,2) not null,
	foreign key (idIngrediente) references ingrediente (id)
);


create table combo (
	id  int primary key,
	nombre varchar (50) not null,
	idProducto int not  null,
	foreign key (idProducto) references producto(id)
);


create table pedido(
	 id int primary key,
	 fecha date not null,
	 hora  varchar (50) not null,
	 idCliente int not null,
	 idProducto int,
	 idCombo int,
	 idIngrediente int,
	 precio decimal (10,2) not null,
	 foreign key (idCliente) references cliente (id),
	 foreign key (idProducto) references producto (id),
	 foreign key (idCombo) references combo(id),
	 foreign key (idIngrediente) references ingrediente(id)
	 
);
