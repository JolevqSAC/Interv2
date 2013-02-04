IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificadoByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificadoByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteCertificadoByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Certificado]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
