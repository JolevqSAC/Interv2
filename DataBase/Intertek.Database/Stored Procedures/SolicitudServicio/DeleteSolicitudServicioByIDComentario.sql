IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudServicioByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudServicioByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudServicioByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudServicio]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
