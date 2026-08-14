-- ==========================================
-- LENGUAJE DE MANIPULACION DE DATOS
-- ==========================================
USE TURISMOPERU_JLLB

--1.	INSERTAR DATOS
--Registrarse como Persona
INSERT INTO JLLB.PERSONA (tipo_persona, nombres, apaterno,amaterno,razon_social,nombre_comercial, id_tipo_documento, numero_documento, telefono, email, id_nacionalidad, estado)
VALUES 
('N', 'Jaime','Ll.','B.', 'Jaime Ll. B.',null,1, '45750000', '956700000','jllanos@abc.edu.pe', 142, 'Activo')

select * from jllb.persona
where numero_documento='45751158'

--Registrarse como Cliente
INSERT INTO JLLB.cliente (id_persona,fecha_nacimiento)
VALUES (104,'1999-06-09')

select * from jllb.CLIENTE
where id_persona=104

--Registrarse como Empleado
INSERT INTO JLLB.CARGO (nombre, descripcion, salario_base)
VALUES ('Cientifico de Datos','Especialista en Analisis de Datos', 10000)

select * from jllb.cargo

INSERT INTO JLLB.empleado (id_persona, id_cargo,fecha_contratacion, salario)
VALUES (104,16,'2023-12-20', 3500)

select * from jllb.empleado
where id_persona=104

--Registrarse como Proveedor
INSERT INTO JLLB.categoria_proveedor (nombrecategoriaproveedor, descripcion)
VALUES ('Ingeniero','Ingeniero de Sistemas')

select * from jllb.categoria_proveedor

INSERT INTO JLLB.proveedor(id_persona, id_categoria, contacto_principal, calificacion)
VALUES (104,16,'Jaime Ll. B.', 4.70)

select * from jllb.proveedor
where id_persona=104

--Registrar su Direccion
Select * from jllb.ciudad
where nombreciudad= 'Cajamarca'

INSERT INTO JLLB.direccion(id_ciudad, calle, numero, referencia, codigo_postal, latitud, longitud, altitud)
VALUES (172, 'Av. J. N.','239','Alt. Cdra Paz','06000',-7.1766, -78.5046,2360)

select * from jllb.direccion
where id_direccion=66

--Registrar su Dirección de Cliente

INSERT INTO JLLB.direccion_cliente(id_persona, id_direccion,tipo_direccion, es_principal)
VALUES (104,66,'Casa', 0)

select * from jllb.cliente
where id_persona=104

select * from jllb.direccion
where id_direccion=66

select * from jllb.direccion_cliente
where id_persona=104

--Registrar su Dirección de Proveedor
INSERT INTO JLLB.direccion_proveedor(id_persona, id_direccion,tipo_direccion, es_principal)
VALUES (104,66,'Envio', 0)

select * from jllb.direccion_proveedor
where id_persona=104

--Registrar una Reserva
select * from jllb.reserva

--2.	ACTUALIZAR DATOS
--Actualiza la dirección cuyo ID sea 57 por los datos de la UNC
Select * from jllb.direccion
where id_direccion = 57

UPDATE JLLB.DIRECCION
SET 
	calle = 'Av. Atahualpa',
	numero=1050,
	referencia ='Frente al Capac Ñan',
	latitud = -7.1725,
	longitud = -78.5236,
	altitud = 2536
where id_direccion = 57
--Actualiza el adelanto de pago de 1000 de a la reserva RES-2026-0031
Select * from jllb.reserva
where codigo_reserva = 'RES-2026-0031'

UPDATE JLLB.RESERVA
SET 
	ADELANTO = 1000,
	saldo_pendiente=precio_total-1000
WHERE id_reserva=31 OR codigo_reserva='RES-2026-0031';

/*
3.	ELIMINAR
Eliminar el lugar turístico que esta temporalmente cerrado
*/
delete FROM JLLB.lugar_turistico
WHERE ESTADO='temporalmente_cerrado'

SELECT * FROM JLLB.lugar_turistico
WHERE ESTADO='temporalmente_cerrado'

