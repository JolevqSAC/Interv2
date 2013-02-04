IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectImformeMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectImformeMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectImformeMuestreo]
(
	@IDInforme int,
	@IDPER int,
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDInforme],
	[IDPER],
	[IDIM],
	[IM_FechaInforme],
	[IM_Procedencia],
	[IM_Destino],
	[IM_Lote],
	[IM_TamanoLote],
	[IM_IndentificacionLote],
	[IM_Presentacion],
	[IM_FechaProd],
	[IM_FechaVenc],
	[IM_Marcas],
	[IM_Nave],
	[IM_Bodega],
	[IM_FechaInspeccion],
	[IM_HoraInicio],
	[IM_HoraFin],
	[IM_LugarInspeccion],
	[IM_EstadoProdEnvase],
	[IM_EstadoProdEmpaque],
	[IM_TemperaturaProd],
	[IM_TemperaturaCamara],
	[IM_EstadoAlmacenLimpieza],
	[IM_EstadoAlmacenEstiba],
	[IM_EstadoAlmacenObservaciones],
	[IM_PlanMuestreo],
	[IM_NumEmpaques],
	[IM_CantidadPesoXMuestra],
	[IM_ObservacionesGenerales],
	[IM_InformacionComplementaria],
	[IM_TipoMuestreo]
	FROM [ImformeMuestreo]
	WHERE [IDInforme] = @IDInforme AND [IDPER] = @IDPER AND [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
