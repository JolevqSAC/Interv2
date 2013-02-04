IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertImformeMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertImformeMuestreo]
GO

CREATE PROCEDURE [dbo].[InsertImformeMuestreo]
(
	@IDInforme int OUT,
	@IDPER int,
	@IDIM int,
	@IM_FechaInforme char(18),
	@IM_Procedencia char(18),
	@IM_Destino char(18),
	@IM_Lote char(18),
	@IM_TamanoLote char(18),
	@IM_IndentificacionLote char(18),
	@IM_Presentacion char(18),
	@IM_FechaProd char(18),
	@IM_FechaVenc char(18),
	@IM_Marcas char(18),
	@IM_Nave char(18),
	@IM_Bodega char(18),
	@IM_FechaInspeccion char(18),
	@IM_HoraInicio char(18),
	@IM_HoraFin char(18),
	@IM_LugarInspeccion char(18),
	@IM_EstadoProdEnvase char(18),
	@IM_EstadoProdEmpaque char(18),
	@IM_TemperaturaProd char(18),
	@IM_TemperaturaCamara char(18),
	@IM_EstadoAlmacenLimpieza char(18),
	@IM_EstadoAlmacenEstiba char(18),
	@IM_EstadoAlmacenObservaciones char(18),
	@IM_PlanMuestreo char(18),
	@IM_NumEmpaques char(18),
	@IM_CantidadPesoXMuestra char(18),
	@IM_ObservacionesGenerales char(18),
	@IM_InformacionComplementaria char(18),
	@IM_TipoMuestreo char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ImformeMuestreo] ([IDPER], [IDIM], [IM_FechaInforme], [IM_Procedencia], [IM_Destino], [IM_Lote], [IM_TamanoLote], [IM_IndentificacionLote], [IM_Presentacion], [IM_FechaProd], [IM_FechaVenc], [IM_Marcas], [IM_Nave], [IM_Bodega], [IM_FechaInspeccion], [IM_HoraInicio], [IM_HoraFin], [IM_LugarInspeccion], [IM_EstadoProdEnvase], [IM_EstadoProdEmpaque], [IM_TemperaturaProd], [IM_TemperaturaCamara], [IM_EstadoAlmacenLimpieza], [IM_EstadoAlmacenEstiba], [IM_EstadoAlmacenObservaciones], [IM_PlanMuestreo], [IM_NumEmpaques], [IM_CantidadPesoXMuestra], [IM_ObservacionesGenerales], [IM_InformacionComplementaria], [IM_TipoMuestreo]) 
	VALUES (@IDPER, @IDIM, @IM_FechaInforme, @IM_Procedencia, @IM_Destino, @IM_Lote, @IM_TamanoLote, @IM_IndentificacionLote, @IM_Presentacion, @IM_FechaProd, @IM_FechaVenc, @IM_Marcas, @IM_Nave, @IM_Bodega, @IM_FechaInspeccion, @IM_HoraInicio, @IM_HoraFin, @IM_LugarInspeccion, @IM_EstadoProdEnvase, @IM_EstadoProdEmpaque, @IM_TemperaturaProd, @IM_TemperaturaCamara, @IM_EstadoAlmacenLimpieza, @IM_EstadoAlmacenEstiba, @IM_EstadoAlmacenObservaciones, @IM_PlanMuestreo, @IM_NumEmpaques, @IM_CantidadPesoXMuestra, @IM_ObservacionesGenerales, @IM_InformacionComplementaria, @IM_TipoMuestreo)

	SET @IDInforme = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
