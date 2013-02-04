IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoSI]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoSI]
(
	@IDSI int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoSI]
	WHERE [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
