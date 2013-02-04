IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSolicitudInspeccionMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSolicitudInspeccionMuestreo]
GO

CREATE PROCEDURE [dbo].[UpdateSolicitudInspeccionMuestreo]
(
	@IDSolicitudInspeccion int,
	@IDPER int,
	@IDSIM int,
	@IDJefeCertificacion int,
	@IDTiposOperaciones int,
	@SOI_CantidadLote char(18),
	@SOI_FechayHora char(18),
	@SOI_Observaciones char(18),
	@SOI_CantExtraer char(18),
	@SOI_CantEmpaquesMuestrear char(18),
	@IDJefeOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [SolicitudInspeccionMuestreo]
	SET [IDJefeCertificacion] = @IDJefeCertificacion, 
		[IDTiposOperaciones] = @IDTiposOperaciones, 
		[SOI_CantidadLote] = @SOI_CantidadLote, 
		[SOI_FechayHora] = @SOI_FechayHora, 
		[SOI_Observaciones] = @SOI_Observaciones, 
		[SOI_CantExtraer] = @SOI_CantExtraer, 
		[SOI_CantEmpaquesMuestrear] = @SOI_CantEmpaquesMuestrear, 
		[IDJefeOperaciones] = @IDJefeOperaciones
	WHERE [IDSolicitudInspeccion] = @IDSolicitudInspeccion AND [IDPER] = @IDPER AND [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
