--Usar base de datos master
USE MASTER

--Validar y Eliminar base de datos
IF DB_ID ('BancoAlimentos_JLLB') IS NOT NULL
	DROP DATABASE BancoAlimentos_JLLB;
	print 'Base de Datos BancoAlimentos_JLLB Eliminado correctamente';
GO

--Crear base de datos
CREATE DATABASE BancoAlimentos_JLLB;
	print 'Base de Datos BancoAlimentos_JLLB Creado Correctamente';
Go

--Usar base de datos Creada
USE BancoAlimentos_JLLB;
	PRINT 'Base de Datos BancoAlimentos_JLLB Seleccionado correctamente';
GO

--Crear el Schema JLLB
CREATE SCHEMA JLLB;
Go
print 'Creado el Schema JLLB correctamente';

--Crear Tablas CategoriaEmpresa
select * into jllb.CategoriaEmpresa
from TURISMOPERU_JLLB.JLLB.categoria_proveedor;
print 'Se creo la tabla CategoriaEmpresa';

Alter table jllb.CategoriaEmpresa
ALTER COLUMN id_categoria int not null
print 'id_region actualizado como not null';
go
--Agregar Llave Primaria CategoriaEmpresa
Alter table jllb.CategoriaEmpresa
add constraint pk_categoriaEmpresa
primary key (id_categoria);
print 'id_categoria actualizado como PK';
go

--Crear Tabla
Create table jllb.EmpresaDonantes (
	IdEmpresa	INT primary key identity(1,1),
	RazonSocial	VARCHAR(120) not null,
	RUC	CHAR(11) not null unique,
	Telefono	VARCHAR(20),
	Correo	VARCHAR(120)not null,
	Estado	BIT Default 0,
	IdCategoria	INT not null,
	Foreign key (IdCategoria) references jllb.CategoriaEmpresa (id_categoria)
);

--Create Table CategoriaAlimento
Create TABLE jllb.CategoriaAlimento (
	IdCategoria int primary key identity(1,1),
	NombreCategoria Varchar(50) not null
);
print 'Se creo la tabla CategoriaAlimento';
go

--Crear Tabla Alimento
Create table jllb.Alimento (
	IdAlimento	INT primary key identity(1,1),
	Nombre	VARCHAR(100) not null,
	IdCategoria	INT not null,
	IdEmpresa	INT not null,
	FechaIngreso	DATE not null,
	FechaVencimiento	DATE not null,
	Cantidad	INT not null ,
	UnidadMedida	VARCHAR(20),
	--Restricciones
	Constraint CHK_Cantidad Check (cantidad >0),
	Constraint CHK_FechaVencimiento Check (FechaVencimiento > FechaIngreso),
	CONSTRAINT FK_Alimento_Categoria FOREIGN KEY (IdCategoria) REFERENCES jllb.CategoriaAlimento(IdCategoria),
	CONSTRAINT FK_Alimento_Empresa FOREIGN KEY (IdEmpresa) REFERENCES jllb.EmpresaDonantes(IdEmpresa)
);
print 'Se creo la tabla Alimento';
go

--Crear Tabla Organizacion
Create table jllb.Organizacion (
IdOrganizacion	INT primary key identity(1,1),
Nombre	VARCHAR(120) not null unique,
Distrito	VARCHAR(60) not null,
Responsable	VARCHAR(100) not null,
Telefono	VARCHAR(20) not null

);
print 'Se creo la tabla Organizacion';
go

--Crear Tabla Entregas
Create table jllb.Entregas (
	IdEntrega	INT primary key identity(1,1),
	IdAlimento	INT not null,
	IdOrganizacion	INT not null,
	FechaEntrega	DATE not null,
	CantidadEntregada	INT not null,
	Constraint CHK_CantidadEntregada check (Cantidadentregada >0),
	CONSTRAINT FK_Alimento_Organizacion FOREIGN KEY (IdOrganizacion) REFERENCES jllb.Organizacion(IdOrganizacion),
	CONSTRAINT FK_Alimento_Entrega FOREIGN KEY (IdAlimento) REFERENCES jllb.Alimento (IdAlimento)
);
print 'Se creo la tabla Entregas';
go

--Crear tabla transportistas
Select shipperid as idtransportista, CompanyName as Empresa, phone as telefono
into jllb.transportista
from Northwind.dbo.Shippers
print 'Se creo la tabla Transportista';
go

--PK a tabla Transportista
alter table jllb.transportista
add constraint pk_idtransportista
primary key (idtransportista);
print 'Se Asignó PK en tabla Transportista';
go

--Crear tabla transportistas
Select * into jllb.ClientesCorporativos
from Northwind.dbo.Customers
Where country in ('USA', 'Mexico', 'Braszil')
print 'Se creo la tabla ClientesCorporativos';
go

--Crear tabla transportistas
Select * into jllb.tipoTransporte
from TURISMOPERU_JLLB.JLLB.tipo_transporte
print 'Se creo la tabla TipoTransporte';
go

--Agregar PK a la tabla TipoTransporte
ALTER TABLE jllb.tipotransporte
add constraint pk_tipotransporte
primary key (id_tipo_transporte);
print 'Se agrego PK a la tabla tipotransporte';
Go

--Select * from jllb.tipoTransporte

-- Agregar Columna IdTipoTransporte en la tabla Transportista
ALTER TABLE jllb.transportista
add id_tipo_transporte int;
print 'Se agregó la columna id_tipotransporte a la tabla Transportista';
go

-- Agregar FK IdTipoTransporte en la tabla Transportista
ALTER TABLE jllb.transportista
add constraint FK_tipotransporte
foreign key (id_tipo_transporte) references jllb.tipotransporte(id_tipo_transporte);
print 'Se agrego FK a la tabla transportista';
Go