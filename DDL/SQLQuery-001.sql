--Comentario
/*
Comentario Multilinea
*/

/* -- SQL SERVER 2025 ENTERPRISE DEVELOPER -- */

--CREAR BASE DE DATOS
--USAR LENGUAJE DE DEFINICION DE DATOS (DDL)

if DB_ID ('Gestion_turistica') is not null
	drop database Gestion_turistica_JLLB
go

Create DATABASE Gestion_turistica_JLLBXXX
go

--Modo uso
USE Gestion_turistica_JLLB

--Eliminar Base de Datos
DROP DATABASE Gestion_turistica_JLLBXXX

--Crear una tabla
Create Table Usuario (
	id int,
	pass varchar(40)
)

--Restricciones
/*
Primary Key /
Foregin Key
Unique
Check 
Default /
Null /
Not null /
identity /
*/

-- Crear Tabla Clientes
CREATE TABLE Cliente (
	--Sin Primary Key
	idcliente int,
	nombrecliente varchar(50),
	Ap_Paterno varchar(50),
	Ap_Materno varchar(50),
	Telefono varchar(9),
	Direccion varchar(150),
	Zip varchar(5),
	FechaNac date
)
--Todos los campos asumen valor null

Create Table Producto(
	idproducto int primary key,
	nombreproducto varchar (50),
	categoriaproducto varchar(50),
	precio money,
	marca varchar(30)
)
--Campo PK asume restriccion PK, not null
-- Los demas automaticamente null.

Create table Categoria (
	idcategoria int primary key identity(1,1),
	nombrecategoria varchar(40) not null
)
--Categoria no admite valores nulos
--idcategoria va cambiando de 1 en 1 automaticamente

Create table EstadoProducto(
	idestado int primary key,
	idproducto int not null,
	Estado varchar(8) default 'Activo' not null
	--Restriccion Foreign key
	Constraint FK_Producto
	foreign key (idproducto) references 
	Producto (idproducto)
)