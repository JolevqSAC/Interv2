IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayo]
(
	@IDOrdenEnsayo int,
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayo]
	WHERE [IDOrdenEnsayo] = @IDOrdenEnsayo AND [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
