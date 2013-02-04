IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]
(
	@IDOrdenEnsayo int,
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayoAnalista]
	WHERE [IDOrdenEnsayo] = @IDOrdenEnsayo AND [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
