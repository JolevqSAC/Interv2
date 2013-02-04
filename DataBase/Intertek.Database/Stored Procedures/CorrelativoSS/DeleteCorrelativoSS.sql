IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoSS]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoSS]
(
	@IDSS int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoSS]
	WHERE [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
