IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificadoInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCertificadoInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectCertificadoInformeEnsayo]
(
	@IDINF int,
	@IDCER int,
	@IDInformeEnsayo int,
	@IDCertificado int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDINF],
	[IDCER],
	[IDInformeEnsayo],
	[IDCertificado],
	[CIE_Fecha],
	[CIE_Modelo],
	[CIE_EsOficialNoOficial]
	FROM [CertificadoInformeEnsayo]
	WHERE [IDINF] = @IDINF AND [IDCER] = @IDCER AND [IDInformeEnsayo] = @IDInformeEnsayo AND [IDCertificado] = @IDCertificado

	SET NOCOUNT OFF
END

GO
