IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoCOTByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoCOT]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
