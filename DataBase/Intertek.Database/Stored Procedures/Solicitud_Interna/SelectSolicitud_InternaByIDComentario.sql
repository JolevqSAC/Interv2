IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitud_InternaByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitud_InternaByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectSolicitud_InternaByIDComentario]
(
	@IDComentario int
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
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
