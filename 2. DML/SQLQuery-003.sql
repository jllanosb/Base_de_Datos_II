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

INSERT INTO TURISMOPERU_JCAA.JCAA.PAIS -- Consulta que debe realizar el estudiante
SELECT nombrepais, codigo_iso --campos a cargar por ser identity el id_pais
FROM TURISMOPERU_JLLB.JLLB.pais --Tabla de otra base de datos

Select * from jllb.pais

--Insertar Datos a la  Tabla Departamento (Region)
INSERT INTO JLLB.region
Select *
From TurismoPeru.dbo.region

--Insertar Datos a la  tabla Subregion (provincias)
INSERT INTO JLLB.subregion
Select nombresubregion,codigo_ubigeo,id_region
From TurismoPeru.dbo.subregion

--Insertar Datos a la  table ciudad o distrito
INSERT INTO JLLB.ciudad
Select nombreciudad, codigo_ubigeo, id_subregion
From TurismoPeru.dbo.ciudad

--insertar Datos a la tabla Nacionalidades
INSERT INTO JLLB.nacionalidad
Select *
From TurismoPeru.dbo.nacionalidad

Select * from jllb.nacionalidad
--Insertar Datos a la  tabla direccion
INSERT INTO JLLB.direccion
Select
	id_ciudad,
	calle,
	numero,
	referencia,
	codigo_postal,
	latitud,
	longitud,
	altitud
From TurismoPeru.dbo.direccion

Select * from jllb.direccion

--Insertar Datos a la  tabla Tipo documento
INSERT INTO JLLB.tipo_documento
Select
	nombredoc,
	abreviatura
From TurismoPeru.dbo.tipo_documento

Select * from jllb.tipo_documento

--Insertar Datos en la Tabla Persona
INSERT INTO JLLB.persona
Select 
	tipo_persona,
	nombres,
	apaterno,
	amaterno,razon_social,
	nombre_comercial,
	id_tipo_documento,
	numero_documento,
	telefono,
	email,
	id_nacionalidad,
	estado,
	fecha_registro
From TurismoPeru.dbo.persona

Select * from jllb.persona

--Insertar Datos a la  tabla Cliente
INSERT INTO JLLB.cliente
Select 
	*
From TurismoPeru.dbo.cliente

Select * from jllb.cliente

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
	*
From TurismoPeru.dbo.empleado

Select * from jllb.empleado

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
	*
From TurismoPeru.dbo.proveedor

Select * from jllb.proveedor

--Insertar Datos a la  tabla tipo_habitacion
INSERT INTO JLLB.tipo_habitacion
Select 
	nombrehabitacion,
	capacidad_personas,
	descripcion
From TurismoPeru.dbo.tipo_habitacion

Select * from jllb.tipo_habitacion

--Insertar Datos a la  tabla tipo_alojamiento
INSERT INTO JLLB.tipo_alojamiento
Select 
	Nombre_Tipo,
	Descripcion,
	Icono_URL
From TurismoPeru.dbo.tipo_alojamiento

Select * from jllb.tipo_alojamiento

--Insertar Datos a la  tabla alojamiento
INSERT INTO JLLB.alojamiento
Select 
	id_tipoalojamiento,
	Nombre,
	Telefono,
	Email,
	Categoria_Estrellas
From TurismoPeru.dbo.alojamiento

Select * from jllb.alojamiento
--Insertar Datos a la  tabla habitacion
INSERT INTO JLLB.habitacion
Select
	id_persona,
	id_alojamiento,
	numero_habitacion,
	id_tipo_habitacion,
	precio_noche,
	estado,
	descripcion
From TurismoPeru.dbo.habitacion

Select * from jllb.habitacion

--Insertar Datos a la  tabla lugar_turistico
INSERT INTO JLLB.lugar_turistico
Select
	nombre,
	descripcion,
	precio_entrada,
	horario_apertura,
	horario_cierre,
	calificacion,
	estado
From TurismoPeru.dbo.lugar_turistico

Select * from jllb.lugar_turistico

--Insertar Datos a la  tabla tipo_transporte

INSERT INTO JLLB.tipo_transporte
Select
	nombre,
	descripcion
From TurismoPeru.dbo.tipo_transporte

Select * from jllb.tipo_transporte
--Insertar Datos a la  tabla vehiculo
INSERT INTO JLLB.vehiculo
Select
	id_proveedor,
	placa,
	id_tipo_transporte,
	marca,
	modelo,
	capacidad_pasajeros,
	año_fabricacion,
	precio_por_km,
	precio_por_hora,
	estado
From TurismoPeru.dbo.vehiculo

Select * from jllb.vehiculo
--Insertar Datos a la  tabla tipo_paquete
INSERT INTO JLLB.tipo_paquete
Select
	nombre,
	descripcion
From TurismoPeru.dbo.tipo_paquete

Select * from jllb.tipo_paquete
--Insertar Datos a la  tabla paquete
INSERT INTO JLLB.paquete
Select
	nombre,
	descripcion,
	id_tipo_paquete,
	duracion_dias,
	duracion_noches,
	precio_base,
	precio_por_persona_adicional,
	capacidad_minima,
	capacidad_maxima,
	incluye_hospedaje,
	incluye_transporte,
	incluye_alimentacion,
	incluye_guia,
	estado,
	fecha_creacion
From TurismoPeru.dbo.paquete

Select * from jllb.paquete

--Insertar Datos a la  tabla medio_pago
INSERT INTO JLLB.medio_pago
Select
	nombre,
	tipo,
	comision_porcentaje,
	estado
From TurismoPeru.dbo.medio_pago

Select * from jllb.medio_pago
--Insertar Datos a la  tabla estado_reserva
INSERT INTO JLLB.estado_reserva
Select
	nombre,
	descripcion
From TurismoPeru.dbo.estado_reserva

Select * from jllb.estado_reserva
--Insertar Datos a la  tabla reserva
INSERT INTO JLLB.reserva
Select
	codigo_reserva,
	id_cliente,
	id_paquete,
	id_empleado,
	id_alojamiento,
	id_habitacion,
	fecha_reserva,
	fecha_inicio,
	fecha_fin,
	numero_personas,
	precio_total,
	adelanto,
	saldo_pendiente,
	id_estado_reserva,
	observaciones
From TurismoPeru.dbo.reserva

Select * from jllb.reserva
--Insertar Datos a la  tabla pago
INSERT INTO JLLB.pago
Select
	id_reserva,
	id_medio_pago,
	monto,
	fecha_pago,
	numero_operacion,
	comprobante,
	estado
From TurismoPeru.dbo.pago

Select * from jllb.pago
--Insertar Datos a la  tabla paquete_lugar
INSERT INTO JLLB.paquete_lugar
Select
	*
From TurismoPeru.dbo.paquete_lugar

Select * from jllb.paquete_lugar

--Insertar Datos a la  tabla paquete_hospedaje
INSERT INTO JLLB.paquete_hospedaje
Select
	*
From TurismoPeru.dbo.paquete_hospedaje

Select * from jllb.paquete_hospedaje
--Insertar Datos a la  tabla reserva_habitacion
INSERT INTO JLLB.reserva_habitacion
Select
	*
From TurismoPeru.dbo.reserva_habitacion

Select * from jllb.reserva_habitacion

--Insertar Datos a la  tabla reserva_transporte
INSERT INTO JLLB.reserva_transporte
Select
	*
From TurismoPeru.dbo.reserva_transporte

Select * from jllb.reserva_transporte

--Insertar Datos a la  tabla proveedor_alojamiento
INSERT INTO JLLB.proveedor_alojamiento
Select
	id_persona,
	id_alojamiento
From TurismoPeru.dbo.proveedor_alojamiento

Select * from jllb.proveedor_alojamiento

--Insertar Datos a la  tabla direccion_alojamiento
INSERT INTO JLLB.direccion_alojamiento
Select
	*
From TurismoPeru.dbo.direccion_alojamiento

Select * from jllb.direccion_alojamiento

--Insertar Datos a la  tabla direccion_empleado
INSERT INTO JLLB.direccion_empleado
Select
	*
From TurismoPeru.dbo.direccion_empleado

Select * from jllb.direccion_empleado

--Insertar Datos a la  tabla direccion_cliente
INSERT INTO JLLB.direccion_cliente
Select
	*
From TurismoPeru.dbo.direccion_cliente

Select * from jllb.direccion_cliente

--Insertar Datos a la  tabla direccion_empleado
INSERT INTO JLLB.direccion_empleado
Select distinct
	*
From TurismoPeru.dbo.direccion_empleado

Select * from jllb.direccion_empleado

--Insertar Datos a la  tabla direccion_lugarturistico
INSERT INTO JLLB.direccion_lugarturistico
Select
	*
From TurismoPeru.dbo.direccion_lugarturistico

Select * from jllb.direccion_lugarturistico

--Insertar Datos a la  tabla direccion_proveedor
INSERT INTO JLLB.direccion_proveedor
Select
	*
From TurismoPeru.dbo.direccion_proveedor

Select * from jllb.direccion_proveedor


--Evidencia final
SELECT 
    s.name AS Esquema,
    t.name AS Tabla,
    dp.name AS Usuario,
    SUM(p.rows) AS TotalRegistros
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.database_principals dp ON s.principal_id = dp.principal_id
INNER JOIN sys.partitions p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1) -- 0 = Heap, 1 = Clustered Index (asegura contar las filas correctamente)
GROUP BY s.name, t.name, dp.name
ORDER BY s.name, t.name;