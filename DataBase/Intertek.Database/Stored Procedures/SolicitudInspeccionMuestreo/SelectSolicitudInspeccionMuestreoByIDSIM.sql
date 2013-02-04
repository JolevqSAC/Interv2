IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudInspeccionMuestreoByIDSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudInspeccionMuestreoByIDSIM]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreoByIDSIM]
(
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
	WHERE [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
