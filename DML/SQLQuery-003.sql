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
delete from jllb.pais
DBCC CHECKIDENT ('jllb.pais', RESEED, 0);

--Cargar Todos los Paises
INSERT INTO JLLB.PAIS
Select nombrepais, codigo_iso
From TurismoPeru.dbo.pais

INSERT INTO TURISMOPERU_JCAA.JCAA.PAIS
SELECT nombrepais, codigo_iso
FROM TURISMOPERU_JLLB.JLLB.pais

select * from TURISMOPERU_LAHM.LAHM.PAIS
delete from TURISMOPERU_LAHM.LAHM.PAIS

Select * from jllb.pais
--Insertar Datos a la  Tabla Departamento (Region)
INSERT INTO JLLB.region
Select nombrepais, codigo_iso
From TurismoPeru.dbo.pais

--Insertar Datos a la  tabla Subregion (provincias)
--Insertar Datos a la  table ciudad o distrito
--Insertar Datos a la  tabla direccion
--Insertar Datos a la  tabla Tipo documento
--Insertar Datos a la  tabla Cliente
--Insertar Datos a la  tabla direccion_cliente
--Insertar Datos a la  tabla cargo
--Insertar Datos a la  tabla empleado
--Insertar Datos a la  tabla direccion_empleado
--Insertar Datos a la  tabla categoria_proveedor
--Insertar Datos a la  tabla proveedor
--Insertar Datos a la  tabla direccion_proveedor
--Insertar Datos a la  tabla tipo_habitacion
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