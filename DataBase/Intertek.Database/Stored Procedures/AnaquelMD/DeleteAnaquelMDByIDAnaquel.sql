IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnaquelMDByIDAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnaquelMDByIDAnaquel]
GO

CREATE PROCEDURE [dbo].[DeleteAnaquelMDByIDAnaquel]
(
	@IDAnaquel int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AnaquelMD]
	WHERE [IDAnaquel] = @IDAnaquel

	SET NOCOUNT OFF
END

GO
