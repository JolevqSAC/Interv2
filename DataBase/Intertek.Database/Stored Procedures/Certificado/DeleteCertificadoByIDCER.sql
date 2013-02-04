IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCertificadoByIDCER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCertificadoByIDCER]
GO

CREATE PROCEDURE [dbo].[DeleteCertificadoByIDCER]
(
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Certificado]
	WHERE [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
