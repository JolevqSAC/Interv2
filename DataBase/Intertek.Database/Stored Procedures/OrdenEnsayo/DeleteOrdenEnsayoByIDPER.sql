IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayo]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
