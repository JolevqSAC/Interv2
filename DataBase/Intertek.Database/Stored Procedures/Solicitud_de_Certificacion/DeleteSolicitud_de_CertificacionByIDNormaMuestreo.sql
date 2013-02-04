IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDNormaMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDNormaMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDNormaMuestreo]
(
	@IDNormaMuestreo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDNormaMuestreo] = @IDNormaMuestreo

	SET NOCOUNT OFF
END

GO
