-- ### Lenguaje de Manipulacion de Datos ###
-- ==========================================
-- INSERCIÓN DE DATOS
-- ==========================================
/*
1ra INSERT INTO TABLA (CAMPOS) VALUES (CAMPOS A INSERTAR)
2ra INSERT INTO TABLA VALUES (CAMPOS A INSERTAR)
3ra INSERT INTO TABLA
SELECT * FROM 
RESPALDO.TABLA
*/
USE TURISMOPERU_JLLB
--Insertar Datos a la  Tabla Pais
INSERT INTO JLLB.PAIS (nombrepais,codigo_iso)
values ('Perú', 'PER')

INSERT INTO JLLB.PAIS values ('Argentina', 'ARG')

--Limpiar registros Tabla jllb.Pais sin alterar la estructura
--truncate table jllb.pais
delete from jllb.region
DBCC CHECKIDENT ('jllb.pais', RESEED, 0);

--Cargar Todos los Paises
INSERT INTO JLLB.PAIS
Select nombrepais, codigo_iso
From TurismoPeru.dbo.pais

INSERT INTO TURISMOPERU_JCAA.JCAA.PAIS
SELECT nombrepais, codigo_iso
FROM TURISMOPERU_JLLB.JLLB.pais

Select * from jllb.pais
--Insertar Datos a la  Tabla Departamento (Region)
INSERT INTO JLLB.region
Select *
From TurismoPeru.dbo.region

INSERT INTO TURISMOPERU_JCAA.JCAA.REGION --BASE USTEDES
SELECT * 
FROM TURISMOPERU_JLLB.JLLB.REGION --DE DONDE EXTRAIGO
Select * from jllb.REGION

--Insertar Datos a la  tabla Subregion (provincias)
INSERT INTO JLLB.subregion
Select nombresubregion,codigo_ubigeo,id_region
From TurismoPeru.dbo.subregion

INSERT INTO TURISMOPERU_JCAA.JCAA.REGION --BASE USTEDES
SELECT * 
FROM TURISMOPERU_JLLB.JLLB.REGION --DE DONDE EXTRAIGO
Select * from jllb.subregion
--Insertar Datos a la  table ciudad o distrito
INSERT INTO JLLB.ciudad
Select nombreciudad, codigo_ubigeo, id_subregion
From TurismoPeru.dbo.ciudad

INSERT INTO TURISMOPERU_JCAA.JCAA.ciudad --BASE USTEDES
SELECT * --corregir
FROM TURISMOPERU_JLLB.JLLB.ciudad --DE DONDE EXTRAIGO
Select * from jllb.ciudad

INSERT INTO JLLB.ciudad
Select *
From TurismoPeru.dbo.direccion

INSERT INTO TURISMOPERU_JCAA.JCAA.ciudad --BASE USTEDES
SELECT * --corregir
FROM TURISMOPERU_JLLB.JLLB.ciudad --DE DONDE EXTRAIGO
Select * from jllb.ciudad

--insertar Datos a la tabla Nacionalidades
INSERT INTO JLLB.nacionalidad
Select *
From TurismoPeru.dbo.nacionalidad

Select * from jllb.nacionalidad
--Insertar Datos a la  tabla direccion


--Insertar Datos a la  tabla Tipo documento
INSERT INTO JLLB.tipo_documento
Select
	nombre as nombredoc,
	abreviatura
From TurismoPeru.dbo.tipo_documento

Select * from jllb.tipo_documento

--Insertar Datos a la  tabla Cliente
INSERT INTO JLLB.cliente
Select 
	nombres,
	apaterno,
	amaterno,
	id_tipo_documento,
	numero_documento,
	telefono,
	email,
	fecha_nacimiento,
	id_nacionalidad,
	fecha_registro,
	estado
From TurismoPeru.dbo.cliente

Select * from jllb.cliente

--Insertar Datos a la  tabla direccion_cliente
--Insertar Datos a la  tabla cargo
INSERT INTO JLLB.cargo
Select 
	nombre,
	descripcion,
	salario_base
From TurismoPeru.dbo.cargo

Select * from jllb.cargo

--Insertar Datos a la  tabla empleado
INSERT INTO JLLB.empleado
Select 
	nombres,
	apaterno,
	amaterno,
	id_tipo_documento,
	numero_documento,
	telefono,
	email,
	id_cargo,
	fecha_contratacion,
	salario, 
	id_nacionalidad,
	estado
From TurismoPeru.dbo.empleado

Select * from jllb.empleado

--Insertar Datos a la  tabla direccion_empleado
--Insertar Datos a la  tabla categoria_proveedor
INSERT INTO JLLB.categoria_proveedor
Select 
 nombrecategoriaproveedor,
 descripcion
From TurismoPeru.dbo.categoria_proveedor

Select * from jllb.categoria_proveedor
--Insertar Datos a la  tabla proveedor
INSERT INTO JLLB.proveedor
Select 
	nombre_comercial, 
	razon_social,
	ruc,
	id_categoria,
	telefono, email,
	id_nacionalidad,
	contacto_principal,
	calificacion,
	estado,
	fecha_registro
From TurismoPeru.dbo.proveedor

Select * from jllb.proveedor

--Insertar Datos a la  tabla direccion_proveedor

--Insertar Datos a la  tabla tipo_habitacion
INSERT INTO JLLB.tipo_habitacion
Select 
	nombrehabitacion,
	capacidad_personas,
	descripcion
From TurismoPeru.dbo.tipo_habitacion

Select * from jllb.tipo_habitacion
--Insertar Datos a la  tabla habitacion
--Insertar Datos a la  tabla lugar_turistico
--Insertar Datos a la  tabla tipo_transporte
--Insertar Datos a la  tabla vehiculo
--Insertar Datos a la  tabla tipo_paquete
--Insertar Datos a la  tabla paquete
--Insertar Datos a la  tabla medio_pago
--Insertar Datos a la  tabla estado_reserva
--Insertar Datos a la  tabla reserva
--Insertar Datos a la  tabla pago
--Insertar Datos a la  tabla paquete_lugar
--Insertar Datos a la  tabla paquete_hospedaje
--Insertar Datos a la  tabla reserva_habitacion
--Insertar Datos a la  tabla reserva_transporte