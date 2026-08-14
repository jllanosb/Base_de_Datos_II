-- Procedimiento Almanacenado con Condicionales IF-ELSE

CREATE OR ALTER PROCEDURE JLLB.sp_DisponibilidadHabitacion
@idhabitacion int
As
Begin
	IF EXISTS(
		Select 1 From JLLB.reserva_habitacion
		Where id_habitacion = @idhabitacion
	)
		print 'Habitacion Reservada';
	ELSE
		IF NOT EXISTS (
			Select 1 From JLLB.habitacion
			Where id_habitacion = @idhabitacion
			)
			print 'Habitación No Existe';
		ELSE
			print 'Habitacion Disponible';
End;
Go
--Ejecutar
EXEC JLLB.sp_DisponibilidadHabitacion 100;