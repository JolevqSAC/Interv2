IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_InternaByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_InternaByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_InternaByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_Interna]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
