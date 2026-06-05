--Estructura Base de Datos
use master
--1. Validar existencia base de datos
if DB_ID ('TURISMOPERU_JLLB') is not null
	drop database TURISMOPERU_JLLB;
	print 'La base de datos TURISMOPERU_JLLB Eliminada';
go

-- 2. Crear la base de datos
CREATE DATABASE TURISMOPERU_JLLB;
print 'Base de datos TURISMOPERU_JLLB creada correctamente';
go

--3. Usar la Base de datos TURISMOPERU_JLLB
use TURISMOPERU_JLLB;
print 'Base de Datos TURISMOPERU_JLLB Seleccionada';
go

--4. Crear Esquema de Tablas
CREATE SCHEMA JLLB;
GO
print 'Se cre� el Esquema JLLB';
go

--5. Crear Estructura de la Tablas
-- Verificar existencia tabla
-- Create Table JLLB.Table
-- Identificando TABLAS
/*
USUARIO
PERSONAL
LUGAR_TURISTICO
PAQUETE_TURISTICO
TIPO_PAQUETE
PROVEEDOR
TIPO_TRANSPORTE
VEHICULO
RUTA
RESERVA
PAGOS
CLIENTE
MEDIO_PAGO
NACIONALIDAD
PAIS
DEPARTAMENTO
PROVINCIA
DISTRITO
DIRECCION
CARGO_EMPLEADO
HOSPEDAJE
HABITACION
--ALIMENTACION
*/

--Tabla Pais
if OBJECT_ID ('jllb.pais', 'U') is not null
begin
	DROP Table jllb.pais;
	print 'Tabla pais Eliminada'
end
go

CREATE TABLE jllb.pais (
	id_pais int identity(1,1) primary key,
	nombrepais nvarchar(100) not null UNIQUE,
	codigo_iso char(3) not null UNIQUE--e.g PER, USA, ESP, COL 
);
print 'Tabla Pais Creada Correctamente';
GO

if OBJECT_ID('jllb.nacionalidad', 'U') is not null
begin
	Drop Table jllb.nacionalidad;
	print 'Tabla Nacionalidad eliminada correctamente';
end
go

CREATE TABLE jllb.nacionalidad (
	id_nacionalidad int primary key,
	nombrenacionalidad nvarchar(100) not null UNIQUE,
	--Foreign Key
	id_pais int null --Solo si aplica a pais reconocido
	constraint FK_paisnacionalidad
	Foreign key (id_pais) References jllb.pais(id_pais)
);
print 'Tabla Nacionalidad Creada';
go

--Crea Tabla Departamento (Region)
if OBJECT_ID('jllb.region', 'u') is not null
begin 
	drop table jllb.region;
	print 'Tabla Region eliminada ';
end
go
CREATE TABLE jllb.region (
	id_region int,
	nombreregion nvarchar(100) not null,
	codigo_ubigeo char(3) not null UNIQUE, --CAJ, LIM, CUS
	id_pais int not null
);
print 'Tabla Region Creada';
go

--Modificar la Tabla Region (Agregar id not null)
ALTER TABLE jllb.region
ALTER COLUMN id_region int not null
print 'id_region actualizado como not null';
go

--Agregar PK a la tabla Region
ALTER TABLE jllb.region
ADD CONSTRAINT PK_idregion
PRIMARY KEY (id_region)
print 'PK id_region asignado';
go

--Agregar FK id_pais a tabla Region
ALTER TABLE jllb.region
add constraint FK_paisregion
Foreign key (id_pais) References jllb.pais(id_pais)
print 'FK id_pais enlazado a region';
go

-- Crear tabla Subregion (provincias)
if OBJECT_ID('jllb.subregion', 'U') is not null
begin
    Drop table jllb.subregion;
    print 'Tabla Subregion eliminada';
end
go
CREATE TABLE jllb.subregion (
    id_subregion int identity (1,1) primary key,
    nombresubregion nvarchar(100) not null,
    codigo_ubigeo char(4) not null UNIQUE,
    id_region int not null
    constraint FK_regionsubregion
    Foreign key (id_subregion) References jllb.region(id_region)
);
print 'Tabla Subregion creada correctamente';
go

--Create table ciudad o distritos
if OBJECT_ID('jllb.ciudad', 'U') is not null
begin
	drop table jllb.ciudad;
	print 'Tabla Ciudad eliminada';
end
go

CREATE TABLE jllb.ciudad (
	id_ciudad int identity(1,1) primary key,
	nombreciudad nvarchar(100) not null,
	codigo_ubigeo char(4) not null UNIQUE,
	id_subregion int not null
	constraint FK_subregionciudad
	Foreign key (id_subregion) References jllb.subregion (id_subregion)
);
print 'Tabla ciudad Creada correctamente';
go

--Crea tabla direccion
IF OBJECT_ID('jllb.direccion', 'U') is not null
begin
	drop table jllb.direccion;
	print 'Tabla Direccion Eliminada';
end
go

CREATE TABLE jllb.direccion (
	id_direccion int primary key identity(1,1),
	id_ciudad int not null,
	calle nvarchar(200), --e.g. Av. Atahualpa
	numero nvarchar(10), --e.g. 1050
	referencia TEXT, --e.g. Frente Capac Ñan
	codigo_postal VARCHAR(10)
	--Restriccion check
	constraint chk_zip check (len(codigo_postal) between 5 and 10) --e.g. 06001,
	constraint FK_direccionciudad
	foreign key (id_ciudad) references jllb.ciudad(id_ciudad)
);
print 'Tabla Direccion Creada';
go

--Crear tabla Tipo documento
if OBJECT_ID('jllb.tipo_documento', 'U') is not null
begin
	Drop table jllb.tipo_documento;
	print 'Tabla Tipo Documento eliminada';
end
go

CREATE TABle jllb.tipo_documento(
	id_tipo_documento int identity(1,1) primary key,
	nombredoc varchar(50) not null UNIQUE,
	abreviatura char(10) not null UNIQUE
);
print 'Tabla Tipo Documento Creado';
go

--Crear tabla Cliente
if OBJECT_ID('jllb.cliente', 'U') is not null
begin
	Drop Table jllb.cliente;
	print 'Tabla Cliente Eliminada';
end
go
CREATE TABLE jllb.cliente (
	id_cliente int identity(1,1) primary key,
	nombres varchar(100) not null,
	apaterno varchar(100) not null,
	amaterno varchar(100) not null,
	id_tipo_documento int not null,--Tipo_documento
	numero_documento varchar(20) not null,
	telefono varchar(15),
	email varchar(100) not null unique,
	fecha_nacimiento date,
	id_nacionalidad int not null, --Nacionalidad
	fecha_registro DATETIME DEFAULT GETDATE(),
	estado varchar(10) DEFAULT 'Activo' CHECK (estado in ('Activo','Inactivo')),
	constraint unique_documento UNIQUE(id_tipo_documento, numero_documento),
	foreign key (id_tipo_documento) References jllb.tipo_documento(id_tipo_documento),
	foreign key (id_nacionalidad) References jllb.nacionalidad (id_nacionalidad)
);
print 'Tabla Cliente Creada';
go
--Crear tabla direccion_cliente
--Crear tabla cargo
--Crear tabla empleado
--Crear tabla direccion_empleado
--Crear tabla categoria_proveedor
--Crear tabla proveedor
--Crear tabla direccion_proveedor
--Crear tabla tipo_habitacion
--Crear tabla habitacion
--Crear tabla lugar_turistico
--Crear tabla tipo_transporte
--Crear tabla vehiculo
--Crear tabla tipo_paquete
--Crear tabla paquete
--Crear tabla medio_pago
--Crear tabla estado_reserva
--Crear tabla reserva
--Crear tabla pago
--Crear tabla paquete_lugar
--Crear tabla paquete_hospedaje
--Crear tabla reserva_habitacion
--Crear tabla reserva_transporte