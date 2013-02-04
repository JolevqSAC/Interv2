IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitud_Interna]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSolicitud_Interna]
GO

CREATE PROCEDURE [dbo].[SelectSolicitud_Interna]
(
	@IDSolicitudInterna int,
	@IDPER int,
	@IDSI int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudInterna],
	[IDPER],
	[IDSI],
	[IDComentario],
	[SOI_FechaEmision],
	[SOI_NumeroSEE],
	[SOI_ObservacionesSEE],
	[SOI_FechaEntrega],
	[SOI_HoraEntrega],
	[SOI_FechaAprobacion],
	[SOI_Estado]
	FROM [Solicitud_Interna]
	WHERE [IDSolicitudInterna] = @IDSolicitudInterna AND [IDPER] = @IDPER AND [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
