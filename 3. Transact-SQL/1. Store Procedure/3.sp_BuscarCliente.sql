---- Procedimiento Almacenado con Parametros

CREATE OR ALTER PROCEDURE JLLB.sp_BuscarCliente
@dni varchar(8)
AS
BEGIN
	Select *
	From jllb.persona p
	Where p.numero_documento = @dni
END;
Go

--Ejecutar
EXEC JLLB.sp_BuscarCliente '44444448';
go