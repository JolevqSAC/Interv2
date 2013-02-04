IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoCertificado]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoCertificado]
(
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoCertificado]
	WHERE [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
