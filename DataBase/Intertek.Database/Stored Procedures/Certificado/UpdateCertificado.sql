IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCertificado]
GO

CREATE PROCEDURE [dbo].[UpdateCertificado]
(
	@IDCertificado int,
	@IDCER int,
	@IDComentario int,
	@CER_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Certificado]
	SET [IDComentario] = @IDComentario, 
		[CER_Fecha] = @CER_Fecha
	WHERE [IDCertificado] = @IDCertificado AND [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
