IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificadoInformeEnsayoByIDCertificadoAndIDCER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCertificadoInformeEnsayoByIDCertificadoAndIDCER]
GO

CREATE PROCEDURE [dbo].[SelectCertificadoInformeEnsayoByIDCertificadoAndIDCER]
(
	@IDCertificado int,
	@IDCER int
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
	WHERE [IDCertificado] = @IDCertificado AND [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
