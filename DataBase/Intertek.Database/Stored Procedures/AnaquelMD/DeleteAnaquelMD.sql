IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnaquelMD]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnaquelMD]
GO

CREATE PROCEDURE [dbo].[DeleteAnaquelMD]
(
	@IDAnaquelMD int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AnaquelMD]
	WHERE [IDAnaquelMD] = @IDAnaquelMD

	SET NOCOUNT OFF
END

GO
