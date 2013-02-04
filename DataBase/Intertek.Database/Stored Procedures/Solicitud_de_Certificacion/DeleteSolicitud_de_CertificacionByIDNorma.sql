IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDNorma]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDNorma]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDNorma]
(
	@IDNorma int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
