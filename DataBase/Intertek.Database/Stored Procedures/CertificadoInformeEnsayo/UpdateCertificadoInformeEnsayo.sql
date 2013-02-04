IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCertificadoInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCertificadoInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateCertificadoInformeEnsayo]
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

	UPDATE [CertificadoInformeEnsayo]
	SET [CIE_Fecha] = @CIE_Fecha, 
		[CIE_Modelo] = @CIE_Modelo, 
		[CIE_EsOficialNoOficial] = @CIE_EsOficialNoOficial
	WHERE [IDINF] = @IDINF AND [IDCER] = @IDCER AND [IDInformeEnsayo] = @IDInformeEnsayo AND [IDCertificado] = @IDCertificado

	SET NOCOUNT OFF
END

GO
