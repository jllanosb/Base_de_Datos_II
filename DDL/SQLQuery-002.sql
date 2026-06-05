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