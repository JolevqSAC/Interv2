IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudInspeccionMuestreoByIDTiposOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudInspeccionMuestreoByIDTiposOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreoByIDTiposOperaciones]
(
	@IDTiposOperaciones int
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
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
