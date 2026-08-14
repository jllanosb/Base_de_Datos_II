-- Calcular el IGV de un Pago
CREATE OR ALTER FUNCTION jllb.fn_CalcularIGVPago
(
	@monto money
)
RETURNS money
as
begin
	return @monto*0.18;
end;
go

Select jllb.fn_CalcularIGVPago (459) as IGV,
GETDATE() as Fecha_Consulta;

Select 
monto,
jllb.fn_CalcularIGVPago(monto) as IGV,
GETDATE() as Fecha_Consulta
from jllb.pago
where monto >=0