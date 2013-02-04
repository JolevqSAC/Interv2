IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoAnalista]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoAnalista]
(
	@IDEnsayo int,
	@IDMetodo int,
	@IDOE int,
	@IDOrdenEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayoAnalista]
	WHERE [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo AND [IDOE] = @IDOE AND [IDOrdenEnsayo] = @IDOrdenEnsayo

	SET NOCOUNT OFF
END

GO
