IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoSCByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoSC]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
