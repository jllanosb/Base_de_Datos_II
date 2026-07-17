
USE BancoAlimentos_JLLB;
PRINT 'Se seleccionó la base de datos BancoAlimentos_JLLB correctamente';
 ---- UPDATE ------
-- 1. Cambiar el teléfono de una empresa (Empresa IdEmpresa = 1: Supermercados Peruanos S.A.)
UPDATE jllb.EmpresaDonantes
SET Telefono = '01-9998877'
WHERE IdEmpresa = 1;
GO

-- 2. Cambiar el responsable de una organización (IdOrganizacion = 1: Comedor Popular 'Mujeres Unidas')
UPDATE jllb.Organizacion
SET Responsable = 'Elena Quispe Mamani'
WHERE IdOrganizacion = 1;
GO

-- 3. Incrementar en 30 unidades la cantidad del alimento "Arroz"
UPDATE jllb.Alimento
SET Cantidad = Cantidad + 30
WHERE Nombre LIKE '%Arroz%';
GO

PRINT 'Se realizaron los 3 cambios correctamente';
GO

--- DELETE ---
-- Paso 1: Insertar una organización que NO recibirá alimentos
INSERT INTO jllb.Organizacion 
(Nombre, Distrito, Responsable, Telefono)
VALUES
('Asociación Manos Solidarias', 'Puente Piedra', 'Luis Vargas Cáceres', '912345678');
GO

-- Paso 2: Verificar qué organizaciones NO tienen entregas
SELECT o.IdOrganizacion, o.Nombre, o.Distrito
FROM jllb.Organizacion o
LEFT JOIN jllb.Entregas e ON o.IdOrganizacion = e.IdOrganizacion
WHERE e.IdEntrega IS NULL;
GO

-- Paso 3: Eliminar la organización que nunca recibió alimentos
DELETE FROM jllb.Organizacion
WHERE IdOrganizacion NOT IN (
    SELECT DISTINCT IdOrganizacion 
    FROM jllb.Entregas
);
GO

PRINT 'Se eliminaron las organizaciones sin entregas';
GO

DELETE FROM jllb.Organizacion
WHERE NOT EXISTS (
    SELECT 1 
    FROM jllb.Entregas e 
    WHERE e.IdOrganizacion = jllb.Organizacion.IdOrganizacion
);