-- Total Pago por una reserva
CREATE OR ALTER FUNCTION jllb.fn_PagoTotalxReserva
(
	@IdReserva int
)
RETURNS MONEY
AS
BEGIN
	Declare @Total money
	Select
		@Total = sum(monto)
	from jllb.pago
	where id_reserva = @IdReserva;

	RETURN isnull (@Total,0);
END;


--ejecutar
Select jllb.fn_PagoTotalxReserva (2) AS MontoPagado,
Getdate() as Fecha_Consulta;