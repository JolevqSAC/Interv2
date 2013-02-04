IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCotizacionByIDProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCotizacionByIDProducto]
GO

CREATE PROCEDURE [dbo].[SelectCotizacionByIDProducto]
(
	@IDProducto int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCotizacion],
	[IDCOT],
	[IDCliente],
	[IDLugarMuestreo],
	[IDComentario],
	[IDProducto],
	[IDPER],
	[COT_FechaRecibido],
	[COT_FechaEntrega],
	[COT_InstruccionesPago],
	[COT_InfoAdicional],
	[COT_Dirimente],
	[COT_TiempoCustodia],
	[COT_DestinoMuestra],
	[COT_Ambientacion],
	[COT_FechaAprobacion],
	[COT_Estado]
	FROM [Cotizacion]
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
