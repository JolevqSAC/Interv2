IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodo]
(
	@IDEnsayoMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodo]
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
