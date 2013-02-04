IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSubEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSubEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteSubEnsayo]
(
	@IDSubEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SubEnsayo]
	WHERE [IDSubEnsayo] = @IDSubEnsayo

	SET NOCOUNT OFF
END

GO
