IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoCOTByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoCOT]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
