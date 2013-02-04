IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudInspeccionMuestreoByIDJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudInspeccionMuestreoByIDJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudInspeccionMuestreoByIDJefeCertificacion]
(
	@IDJefeCertificacion int
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
	WHERE [IDJefeCertificacion] = @IDJefeCertificacion

	SET NOCOUNT OFF
END

GO
