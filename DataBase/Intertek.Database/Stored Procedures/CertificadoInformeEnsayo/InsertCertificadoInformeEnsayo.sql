IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCertificadoInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCertificadoInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertCertificadoInformeEnsayo]
(
	@IDINF int,
	@IDCER int,
	@IDInformeEnsayo int,
	@IDCertificado int,
	@CIE_Fecha char(18),
	@CIE_Modelo char(18),
	@CIE_EsOficialNoOficial char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CertificadoInformeEnsayo] ([IDINF], [IDCER], [IDInformeEnsayo], [IDCertificado], [CIE_Fecha], [CIE_Modelo], [CIE_EsOficialNoOficial]) 
	VALUES (@IDINF, @IDCER, @IDInformeEnsayo, @IDCertificado, @CIE_Fecha, @CIE_Modelo, @CIE_EsOficialNoOficial)

	SET NOCOUNT OFF
END

GO
