--Procedimiento Almacenado con CASE
CREATE OR ALTER PROCEDURE JLLB.sp_clasificarpagos
as
Begin
	Select 
		monto,
		CASE
			WHEN monto < 0 then 'Nota Credito'
			WHEN monto < 1000 then 'Bajo'
			When monto < 2500 then 'Medio'
		Else 'Alto'
		end Nivel
	From JLLB.pago;
End;
Go

--Ejecutar
EXEC JLLB.sp_clasificarpagos;
Go