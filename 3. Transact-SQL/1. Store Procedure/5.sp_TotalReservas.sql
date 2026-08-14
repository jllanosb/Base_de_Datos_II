--Procedimiento Almacenado con OUTPUT

CREATE OR ALTER PROCEDURE JLLB.sp_TotalReservas
@total int output
as
Begin
	Select 
	@total=count(*)
	From jllb.reserva;
End;
Go

--Ejecutar
Declare @cantidad int EXEC JLLB.sp_TotalReservas @cantidad output;

Select @cantidad as Total_Reservas;