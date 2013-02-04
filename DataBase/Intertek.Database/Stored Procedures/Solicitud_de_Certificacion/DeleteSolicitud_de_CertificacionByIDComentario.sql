IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
