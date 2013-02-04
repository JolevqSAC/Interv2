IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCertificado]
GO

CREATE PROCEDURE [dbo].[InsertCertificado]
(
	@IDCertificado int OUT,
	@IDCER int,
	@IDComentario int,
	@CER_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Certificado] ([IDCER], [IDComentario], [CER_Fecha]) 
	VALUES (@IDCER, @IDComentario, @CER_Fecha)

	SET @IDCertificado = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
