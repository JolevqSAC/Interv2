IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificadoInformeEnsayoByIDCertificadoAndIDCER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificadoInformeEnsayoByIDCertificadoAndIDCER]
GO

CREATE PROCEDURE [dbo].[DeleteCertificadoInformeEnsayoByIDCertificadoAndIDCER]
(
	@IDCertificado int,
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CertificadoInformeEnsayo]
	WHERE [IDCertificado] = @IDCertificado AND [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
