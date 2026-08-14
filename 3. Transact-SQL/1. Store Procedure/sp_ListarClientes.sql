CREATE OR ALTER PROCEDURE jllb.sp_ListarClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From jllb.persona p
    inner join jllb.cliente c
    on p.id_persona = c.id_persona
END
GO
