IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnaquel]
GO

CREATE PROCEDURE [dbo].[DeleteAnaquel]
(
	@IDAnaquel int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Anaquel]
	WHERE [IDAnaquel] = @IDAnaquel

	SET NOCOUNT OFF
END

GO
