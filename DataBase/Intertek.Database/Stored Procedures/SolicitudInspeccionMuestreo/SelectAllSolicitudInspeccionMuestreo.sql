IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSolicitudInspeccionMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSolicitudInspeccionMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectAllSolicitudInspeccionMuestreo]

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

	SET NOCOUNT OFF
END

GO
