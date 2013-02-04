IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodo]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
