IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectImformeMuestreoByIDIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectImformeMuestreoByIDIM]
GO

CREATE PROCEDURE [dbo].[SelectImformeMuestreoByIDIM]
(
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
	WHERE [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
