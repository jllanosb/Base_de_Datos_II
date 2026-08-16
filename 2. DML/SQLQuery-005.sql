-- --> CAMBIAR xxx POR SUS DATOS

-- Crear Tabla de auditoría para validar cambios en Tabla Transporte
CREATE TABLE xxx.TipoTransporte_Log (
    id_tipo_transporte NVARCHAR (5), --
    Accion NVARCHAR (20),
    Fecha DATETIME DEFAULT GETDATE ()
);

--Habilitar Temporalmente Insertar el mismo ID identity de origen en el destino
SET IDENTITY_INSERT xxx.tipo_transporte ON;

-- USO DE MERGE PARA SINCRONIZAR INFORMACION
MERGE INTO turismoperu_xxx.xxx.tipo_transporte AS Target -- Tabla destino
USING turismoperu_jllb.jllb.tipo_transporte AS Source -- Tabla origen
ON (
    Target.id_tipo_transporte = Source.id_tipo_transporte
) --campo validacion ambas tablas
--Actualizar campos
WHEN MATCHED THEN
UPDATE
SET
    Target.nombre = Source.nombre, --campo a actualizar
    Target.descripcion = Source.descripcion --campo a actualizar
    --Inserta registros sino existe
    WHEN NOT MATCHED BY TARGET THEN
INSERT (
        id_tipo_transporte,
        nombre,
        descripcion
    ) -- campos tabla destino
VALUES (
        Source.id_tipo_transporte,
        Source.nombre,
        Source.descripcion
    ) -- campos tabla origen
    --Elimina registros en el destino sino existe en el origen
    WHEN NOT MATCHED BY SOURCE THEN -- CUANDO NO EXISTA MATCH DEL DESTINO CON EL ORIGEN
    DELETE
    --Inserta las operaciones realizadas en Tabla Auditoria
    OUTPUT $action AS Accion,
    COALESCE(
        INSERTED.id_tipo_transporte,
        DELETED.id_tipo_transporte
    ) AS id_tipo_transporte, --insertar en la tabla auditoria 
    GETDATE () AS Fecha INTO xxx.TipoTransporte_Log (
        Accion,
        id_tipo_transporte,
        Fecha
    );

--Verificar registros log
select * from xxx.TipoTransporte_Log

--Verificar cambios en la tabla destino
select * from xxx.Tipo_Transporte