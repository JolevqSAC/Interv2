IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[SelectCertificadoInformeEnsayoByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
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
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
