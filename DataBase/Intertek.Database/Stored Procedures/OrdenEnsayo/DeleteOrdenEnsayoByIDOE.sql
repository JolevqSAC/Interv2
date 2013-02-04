IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoByIDOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoByIDOE]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoByIDOE]
(
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayo]
	WHERE [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
