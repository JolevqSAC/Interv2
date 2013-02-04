IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSubEnsayoByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSubEnsayoByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteSubEnsayoByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SubEnsayo]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
