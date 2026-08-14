USE BancoAlimentos_JLLB;
PRINT 'Se seleccionó la base de datos BancoAlimentos_JLLB correctamente';

--Select * from jllb.CategoriaEmpresa
INSERT INTO jllb.CategoriaEmpresa values
('Alimentos','Productor / Proveedor de Alimentos');

--Select * from jllb.EmpresaDonantes
INSERT INTO jllb.EmpresaDonantes 
(RazonSocial, RUC, Telefono, Correo, Estado, IdCategoria)
VALUES
('Supermercados Peruanos S.A.',        '20100036714', '01-4567890', 'contacto@superperuanos.com',    1, 17),
('Distribuidora de Alimentos Andinos', '20512345678', '01-2345678', 'ventas@andalimentos.com',       1, 17),
('Lácteos del Valle S.A.C.',           '20678901234', '01-3456789', 'info@lacteosvalle.com',         1, 17),
('Panadería Integral Lima',            '20345678901', '987654321',  'contacto@panintegral.com',      0, 17),
('Conservas del Pacífico S.A.',        '20456789012', '01-5678901', 'ventas@conservaspacifico.com',  1, 17),
('Granos y Semillas del Sur',          '20789012345', '054-234567', 'info@granossur.com',            0, 17),
('Aceites y Derivados Lima S.A.C.',    '20890123456', '01-6789012', 'contacto@aceiteslima.com',      1, 17),
('Cárnicos Selectos del Perú',         '20901234567', '998877665',  'ventas@carnicosselectos.com',   1, 17),
('Bebidas Naturales Andinas S.A.',     '20112233445', '01-7890123', 'info@bebidasandinas.com',       0, 17),
('Dulces y Golosinas Express',         '20223344556', '01-8901234', 'contacto@dulcesexpress.com',    1, 17);
GO

PRINT 'Se insertaron 10 empresas correctamente';
GO

--Select * from jllb.Categoriaalimento
-- Solo si la tabla está vacía o quieres reiniciarla
DBCC CHECKIDENT ('jllb.CategoriaAlimento', RESEED, 1);
GO

INSERT INTO jllb.CategoriaAlimento (NombreCategoria)
VALUES
('Granos y Cereales'),
('Enlatados y Conservas'),
('Lácteos'),
('Aceites y Grasas'),
('Bebidas');
GO


--alimentos
DBCC CHECKIDENT ('jllb.Alimento', RESEED, 1);
GO
INSERT INTO jllb.Alimento 
(Nombre, IdCategoria, IdEmpresa, FechaIngreso, FechaVencimiento, Cantidad, UnidadMedida)
VALUES
-- Granos y Cereales (IdCategoria = 1)
('Arroz Costeño', 1, 1, '2026-07-01', '2027-07-01', 50, 'kg'),
('Fideos Don Vittorio', 1, 2, '2026-07-02', '2027-08-15', 30, 'kg'),
('Harina de Trigo', 1, 3, '2026-07-03', '2027-06-20', 25, 'kg'),
('Quinua Orgánica', 1, 4, '2026-07-04', '2027-09-10', 15, 'kg'),
('Avena en Hojuelas', 1, 5, '2026-07-05', '2027-05-30', 20, 'kg'),

-- Enlatados y Conservas (IdCategoria = 2)
('Atún en Aceite', 2, 6, '2026-07-01', '2028-01-15', 100, 'unidades'),
('Sardinas en Tomate', 2, 7, '2026-07-02', '2028-03-20', 80, 'unidades'),
('Menestra de Lentejas', 2, 8, '2026-07-03', '2027-12-10', 40, 'kg'),
('Duraznos en Almíbar', 2, 9, '2026-07-04', '2027-11-25', 60, 'unidades'),

-- Lácteos (IdCategoria = 3)
('Leche Evaporada Gloria', 3, 10, '2026-07-05', '2026-12-31', 120, 'unidades'),
('Yogurt Natural', 3, 1, '2026-07-06', '2026-08-15', 50, 'litros'),
('Queso Fresco', 3, 2, '2026-07-07', '2026-09-30', 30, 'kg'),

-- Aceites y Grasas (IdCategoria = 4)
('Aceite Vegetal Primor', 4, 3, '2026-07-01', '2027-10-20', 40, 'litros'),
('Aceite de Oliva Extra Virgen', 4, 4, '2026-07-02', '2027-12-15', 20, 'litros'),

-- Bebidas (IdCategoria = 5)
('Agua Mineral San Luis', 4, 5, '2026-07-03', '2027-06-30', 200, 'unidades');
GO

PRINT 'Se insertaron 15 alimentos correctamente';
GO

--organizaciones
INSERT INTO jllb.Organizacion 
(Nombre, Distrito, Responsable, Telefono)
VALUES
('Comedor Popular Mujeres Unidas', 'San Juan de Lurigancho', 'María Quispe Mamani', '987654321'),
('Olla Común Esperanza del Pueblo', 'Villa El Salvador', 'Rosa Condori Huanca', '976543210'),
('Asociación Benéfica Manos que Ayudan', 'Ate', 'Carlos Huamán Rojas', '965432109'),
('Club de Madres Nueva Vida', 'Comas', 'Juana Fernández López', '954321098'),
('Comedor Infantil Semillita de Mostaza', 'San Martín de Porres', 'Pedro Sánchez Torres', '943210987'),
('Olla Común Corazón de Jesús', 'Los Olivos', 'Lucía Ramos Paredes', '932109876'),
('Asociación Alimentando Futuro', 'Carabayllo', 'Jorge Mendoza Silva', '921098765'),
('Comedor Popular Unión y Progreso', 'El Agustino', 'Ana Chávez Gutiérrez', '910987654');
GO

PRINT 'Se insertaron 8 organizaciones correctamente';
GO

--entregas
INSERT INTO jllb.Entregas 
(IdAlimento, IdOrganizacion, FechaEntrega, CantidadEntregada)
VALUES
-- Entregas de Granos y Cereales
(1, 1, '2026-07-10', 10),   -- Arroz a Mujeres Unidas
(1, 2, '2026-07-12', 15),   -- Arroz a Esperanza del Pueblo
(1, 3, '2026-07-15', 8),    -- Arroz a Manos que Ayudan
(2, 4, '2026-07-11', 10),   -- Fideos a Nueva Vida
(2, 5, '2026-07-13', 12),   -- Fideos a Semillita de Mostaza
(3, 6, '2026-07-14', 10),   -- Harina a Corazón de Jesús
(3, 7, '2026-07-16', 8),    -- Harina a Alimentando Futuro
(4, 8, '2026-07-12', 5),    -- Quinua a Unión y Progreso
(5, 1, '2026-07-17', 10),   -- Avena a Mujeres Unidas

-- Entregas de Enlatados y Conservas
(6, 2, '2026-07-10', 20),   -- Atún a Esperanza del Pueblo
(6, 3, '2026-07-14', 30),   -- Atún a Manos que Ayudan
(7, 4, '2026-07-11', 25),   -- Sardinas a Nueva Vida
(7, 5, '2026-07-16', 20),   -- Sardinas a Semillita de Mostaza
(8, 6, '2026-07-13', 15),   -- Lentejas a Corazón de Jesús
(9, 7, '2026-07-15', 20),   -- Duraznos a Alimentando Futuro

-- Entregas de Lácteos
(10, 8, '2026-07-10', 30),  -- Leche a Unión y Progreso
(10, 1, '2026-07-13', 40),  -- Leche a Mujeres Unidas
(11, 2, '2026-07-12', 15),  -- Yogurt a Esperanza del Pueblo
(12, 3, '2026-07-14', 10),  -- Queso a Manos que Ayudan

-- Entregas de Aceites y Grasas
(13, 4, '2026-07-11', 10),  -- Aceite Primor a Nueva Vida
(13, 5, '2026-07-16', 15),  -- Aceite Primor a Semillita de Mostaza
(14, 6, '2026-07-13', 5),   -- Aceite Oliva a Corazón de Jesús

-- Entregas de Bebidas
(15, 7, '2026-07-12', 50),  -- Agua a Alimentando Futuro
(15, 8, '2026-07-15', 60);  -- Agua a Unión y Progreso
GO

PRINT 'Se insertaron 25 entregas correctamente';
GO

Select * from jllb.Alimento