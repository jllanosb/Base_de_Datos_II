--Obtener el nombre completo de una persona

CREATE OR ALTER FUNCTION jllb.fn_NombreCompletoPersona
(
	@IdPersona int
)
RETURNS VARCHAR(200)
AS
BEGIN
	Declare @nombrecompleto Varchar(200);
	Select
		@nombrecompleto =
		nombres + ' ' +
		apaterno + ' ' +
		amaterno
	from jllb.persona
	where id_persona = @IdPersona;
	--
	Return @nombrecompleto;
END
GO
