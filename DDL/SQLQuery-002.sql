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

CREATE TABLE JLLB.PAIS (
	id_pais int identity(1,1) primary key,
	nombrepais nvarchar(100) not null UNIQUE,
	codigo_iso char(3) not null UNIQUE --e.g PER, USA, ESP, COL 
);
print 'Tabla Pais Creada Correctamente';
GO