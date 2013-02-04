IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSolicitud_Interna]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSolicitud_Interna]
GO

CREATE PROCEDURE [dbo].[SelectAllSolicitud_Interna]

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

	SET NOCOUNT OFF
END

GO
