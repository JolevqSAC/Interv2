IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCotizacionByIDLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCotizacionByIDLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectCotizacionByIDLugarMuestreo]
(
	@IDLugarMuestreo int
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
	WHERE [IDLugarMuestreo] = @IDLugarMuestreo

	SET NOCOUNT OFF
END

GO
