IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCertificadoInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCertificadoInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllCertificadoInformeEnsayo]

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

	SET NOCOUNT OFF
END

GO
