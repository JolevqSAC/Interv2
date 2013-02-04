IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudInspeccionMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreo]
(
	@IDSolicitudInspeccion int,
	@IDPER int,
	@IDSIM int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudInspeccion],
	[IDPER],
	[IDSIM],
	[IDJefeCertificacion],
	[IDTiposOperaciones],
	[SOI_CantidadLote],
	[SOI_FechayHora],
	[SOI_Observaciones],
	[SOI_CantExtraer],
	[SOI_CantEmpaquesMuestrear],
	[IDJefeOperaciones]
	FROM [SolicitudInspeccionMuestreo]
	WHERE [IDSolicitudInspeccion] = @IDSolicitudInspeccion AND [IDPER] = @IDPER AND [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
