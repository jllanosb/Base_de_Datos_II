USE BancoAlimentos_JLLB;
PRINT 'Se seleccionó la base de datos BancoAlimentos_JLLB correctamente';

-- CONSULTAS BASICAS
-- 1.
SELECT 
    a.IdAlimento,
    ca.NombreCategoria AS Categoria,
    a.Nombre AS Alimento,
    a.Cantidad,
    a.UnidadMedida,
    a.FechaVencimiento
FROM jllb.Alimento a
INNER JOIN jllb.CategoriaAlimento ca ON a.IdCategoria = ca.IdCategoria
ORDER BY ca.NombreCategoria ASC, a.Nombre ASC;

--2.
SELECT TOP 5
    a.IdAlimento,
    a.Nombre AS Alimento,
    ca.NombreCategoria AS Categoria,
    a.Cantidad,
    a.UnidadMedida
FROM jllb.Alimento a
INNER JOIN jllb.CategoriaAlimento ca ON a.IdCategoria = ca.IdCategoria
ORDER BY a.Cantidad DESC;
--3.
SELECT 
    a.IdAlimento,
    a.Nombre AS Alimento,
    a.FechaVencimiento,
    DATEDIFF(DAY, GETDATE(), a.FechaVencimiento) AS DiasParaVencer
FROM jllb.Alimento a
WHERE a.FechaVencimiento <= DATEADD(MONTH, 1, GETDATE())
  AND a.FechaVencimiento >= GETDATE()
ORDER BY a.FechaVencimiento ASC;

SELECT *
FROM jllb.Alimento
WHERE FechaVencimiento <= DATEADD(MONTH, 1, GETDATE());

--4.
SELECT 
    IdEmpresa,
    RazonSocial,
    RUC,
    Telefono,
    Correo,
    CASE Estado 
        WHEN 1 THEN 'Activo' 
        WHEN 0 THEN 'Inactivo' 
    END AS EstadoDescripcion
FROM jllb.EmpresaDonantes
WHERE Estado = 1
ORDER BY RazonSocial;

--5.
SELECT 
    IdOrganizacion,
    Nombre,
    Distrito,
    Responsable,
    Telefono
FROM jllb.Organizacion
WHERE Distrito = 'San Juan de Lurigancho';


--6.
SELECT DISTINCT Distrito 
FROM jllb.Organizacion 
ORDER BY Distrito;

SELECT 
    o.Nombre AS Organizacion,
    o.Distrito,
    o.Responsable,
    COUNT(e.IdEntrega) AS TotalEntregas
FROM jllb.Organizacion o
LEFT JOIN jllb.Entregas e ON o.IdOrganizacion = e.IdOrganizacion
WHERE o.Distrito = 'San Juan de Lurigancho'
GROUP BY o.IdOrganizacion, o.Nombre, o.Distrito, o.Responsable;

-- CONSULTAS INTEGRADAS
--1.
SELECT COUNT(*) AS TotalAlimentosRegistrados
FROM jllb.Alimento;

--2.
SELECT AVG(AlimentosPorEmpresa) AS PromedioTiposAlimentosPorEmpresa
FROM (
    SELECT IdEmpresa, COUNT(*) AS AlimentosPorEmpresa
    FROM jllb.Alimento
    GROUP BY IdEmpresa
) AS Subconsulta;

--3.
SELECT 
    MAX(Cantidad) AS MayorCantidadRegistrada,
    (SELECT Nombre FROM jllb.Alimento WHERE Cantidad = (SELECT MAX(Cantidad) FROM jllb.Alimento)) AS Alimento
FROM jllb.Alimento;

--4.
SELECT 
    MAX(FechaIngreso) AS FechaIngresoMasReciente,
    DATEDIFF(DAY, MAX(FechaIngreso), GETDATE()) AS DiasDesdeEsaFecha
FROM jllb.Alimento;

--5.
SELECT SUM(Cantidad) AS TotalUnidadesEnStock
FROM jllb.Alimento;

--6.
SELECT 
    a.Nombre AS Alimento,
    SUM(e.CantidadEntregada) AS TotalEntregado
FROM jllb.Alimento a
INNER JOIN jllb.Entregas e ON a.IdAlimento = e.IdAlimento
GROUP BY a.IdAlimento, a.Nombre
ORDER BY TotalEntregado DESC;

--7.
SELECT IdAlimento, Nombre, Cantidad, UnidadMedida
FROM jllb.Alimento
WHERE Cantidad = (SELECT MIN(Cantidad) FROM jllb.Alimento);

--8.
SELECT IdAlimento, Nombre, FechaVencimiento
FROM jllb.Alimento
WHERE FechaVencimiento = (SELECT MIN(FechaVencimiento) FROM jllb.Alimento);

--9.
SELECT 
    COUNT(*) AS TotalRegistros,
    SUM(Cantidad) AS TotalUnidades,
    AVG(Cantidad) AS PromedioUnidades,
    MIN(Cantidad) AS MinimaCantidad,
    MAX(Cantidad) AS MaximaCantidad
FROM jllb.Alimento;

-- CONSULTAS JOINS
--1
SELECT 
    ed.RazonSocial AS Empresa,
    ca.NombreCategoria AS Categoria,
    a.Nombre AS Alimento,
    a.Cantidad,
    a.UnidadMedida
FROM jllb.Alimento a
INNER JOIN jllb.EmpresaDonantes ed ON a.IdEmpresa = ed.IdEmpresa
INNER JOIN jllb.CategoriaAlimento ca ON a.IdCategoria = ca.IdCategoria
ORDER BY ed.RazonSocial, ca.NombreCategoria, a.Nombre;

--2.
SELECT 
    o.Nombre AS Organizacion,
    a.Nombre AS Alimento,
    e.CantidadEntregada,
    e.FechaEntrega
FROM jllb.Entregas e
INNER JOIN jllb.Organizacion o ON e.IdOrganizacion = o.IdOrganizacion
INNER JOIN jllb.Alimento a ON e.IdAlimento = a.IdAlimento
ORDER BY e.FechaEntrega, o.Nombre;

--3.
SELECT 
    ed.RazonSocial AS Empresa,
    COUNT(a.IdAlimento) AS NumeroAlimentosRegistrados
FROM jllb.EmpresaDonantes ed
INNER JOIN jllb.Alimento a ON ed.IdEmpresa = a.IdEmpresa
GROUP BY ed.IdEmpresa, ed.RazonSocial
ORDER BY NumeroAlimentosRegistrados DESC;