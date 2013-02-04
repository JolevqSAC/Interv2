IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudInspeccionMuestreoByIDJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudInspeccionMuestreoByIDJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreoByIDJefeOperaciones]
(
	@IDJefeOperaciones int
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
	WHERE [IDJefeOperaciones] = @IDJefeOperaciones

	SET NOCOUNT OFF
END

GO
