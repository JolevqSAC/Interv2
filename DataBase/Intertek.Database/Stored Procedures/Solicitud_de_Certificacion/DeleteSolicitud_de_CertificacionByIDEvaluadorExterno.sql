IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDEvaluadorExterno]
(
	@IDEvaluadorExterno int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDEvaluadorExterno] = @IDEvaluadorExterno

	SET NOCOUNT OFF
END

GO
