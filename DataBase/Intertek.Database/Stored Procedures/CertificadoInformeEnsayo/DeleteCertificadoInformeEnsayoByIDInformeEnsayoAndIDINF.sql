IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[DeleteCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CertificadoInformeEnsayo]
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
