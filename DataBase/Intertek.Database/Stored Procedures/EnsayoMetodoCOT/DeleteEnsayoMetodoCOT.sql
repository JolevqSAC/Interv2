IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoCOT]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoCOT]
(
	@IDEnsayoMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoCOT]
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
