CREATE OR ALTER PROCEDURE jllb.sp_ListarPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From jllb.persona
END
GO