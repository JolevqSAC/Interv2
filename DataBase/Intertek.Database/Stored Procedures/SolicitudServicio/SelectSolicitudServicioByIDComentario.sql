IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudServicioByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudServicioByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudServicioByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudServicio],
	[IDSS],
	[IDComentario],
	[IDPER],
	[IDProveedor],
	[SOS_Fecha]
	FROM [SolicitudServicio]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
