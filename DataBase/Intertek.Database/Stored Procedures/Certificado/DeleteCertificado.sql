IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificado]
GO

CREATE PROCEDURE [dbo].[DeleteCertificado]
(
	@IDCertificado int,
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Certificado]
	WHERE [IDCertificado] = @IDCertificado AND [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
