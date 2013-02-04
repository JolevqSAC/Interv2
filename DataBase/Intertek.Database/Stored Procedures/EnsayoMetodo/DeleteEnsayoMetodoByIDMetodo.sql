IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodo]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
