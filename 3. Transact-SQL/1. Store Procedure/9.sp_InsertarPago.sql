--SP con Try - Catch
--INSERTAR UN PAGO
CREATE OR ALTER PROCEDURE JLLB.sp_InsertarPago
@idreserva int,
@idmediopago int, 
@monto decimal(10,2),
@numop varchar(20),
@comprobante varchar(20),
@estado nvarchar(20)
as
Begin
	Begin Try
		INSERT INTO JLLB.PAGO
		(id_reserva, id_medio_pago, monto, fecha_pago ,numero_operacion, comprobante,estado)
		VALUES (@idreserva, @idmediopago, @monto, GETDATE(), @numop, @comprobante, @estado);
		print 'Pago Registrado';
	End Try
	Begin catch
		select ERROR_MESSAGE();
	End catch
End;
Go
Select * from jllb.reserva where id_estado_reserva = 1

Select *
from jllb.pago
    --Ejecutar 
    EXEC JLLB.sp_InsertarPago 33, 7, 1300.50, 'YAPE-0007', 'YAPE-ADE-1', 'Pendiente';