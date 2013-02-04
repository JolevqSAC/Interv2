IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorInterno]
(
	@IDEvaluadorInterno int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDEvaluadorInterno] = @IDEvaluadorInterno

	SET NOCOUNT OFF
END

GO
