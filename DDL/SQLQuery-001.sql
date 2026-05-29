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
Primary Key
Foregin Key
Unique
Check
Default
Null
Not null
identity
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

