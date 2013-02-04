IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCotizacion]
GO

CREATE PROCEDURE [dbo].[SelectAllCotizacion]

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

	SET NOCOUNT OFF
END

GO
