IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoOE]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoOE]
(
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoOE]
	WHERE [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
