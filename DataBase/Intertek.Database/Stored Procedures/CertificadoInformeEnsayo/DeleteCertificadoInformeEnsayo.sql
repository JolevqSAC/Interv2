IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificadoInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificadoInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteCertificadoInformeEnsayo]
(
	@IDINF int,
	@IDCER int,
	@IDInformeEnsayo int,
	@IDCertificado int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CertificadoInformeEnsayo]
	WHERE [IDINF] = @IDINF AND [IDCER] = @IDCER AND [IDInformeEnsayo] = @IDInformeEnsayo AND [IDCertificado] = @IDCertificado

	SET NOCOUNT OFF
END

GO
