-- Procedimiento Almacenado sin Parametros

CREATE OR ALTER PROCEDURE JLLB.sp_ListarClientes
AS
BEGIN
	Select *
	From jllb.persona p
	inner join jllb.cliente c
	on p.id_persona = c.id_persona
END

--Ejecutar
EXEC JLLB.sp_ListarClientes;