--Procedimiento Almacenado con Variables Locales

CREATE OR ALTER PROCEDURE JLLB.sp_TotalPagos
as
Begin
	Declare @total money;
	Select 
	@total=sum(monto)
	from jllb.pago;
	Select @total as Total_Pagos;
end;
Go
--Ejecutar
EXEC JLLB.sp_TotalPagos;
Go