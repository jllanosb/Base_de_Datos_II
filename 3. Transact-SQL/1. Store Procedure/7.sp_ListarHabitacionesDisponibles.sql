CREATE OR ALTER PROCEDURE JLLB.sp_ListarHabitacionesDisponible
@estado Nvarchar(11)
As
Begin
	if (@estado = 'Disponible')
		Select * From JLLB.habitacion
		Where estado = @estado;
End;
Go
--Ejecutar
EXEC JLLB.sp_ListarHabitacionesDisponible 'Disponible';