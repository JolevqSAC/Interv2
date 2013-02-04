IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDJefeCertificacion]
(
	@IDJefeCertificacion int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDJefeCertificacion] = @IDJefeCertificacion

	SET NOCOUNT OFF
END

GO
