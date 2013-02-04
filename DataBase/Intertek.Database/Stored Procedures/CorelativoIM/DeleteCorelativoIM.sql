IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorelativoIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorelativoIM]
GO

CREATE PROCEDURE [dbo].[DeleteCorelativoIM]
(
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorelativoIM]
	WHERE [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
