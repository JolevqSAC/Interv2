IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoSE]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoSE]
(
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoSE]
	WHERE [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
