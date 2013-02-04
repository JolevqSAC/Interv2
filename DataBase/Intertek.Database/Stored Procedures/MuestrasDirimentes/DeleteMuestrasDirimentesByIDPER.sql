IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMuestrasDirimentesByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMuestrasDirimentesByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteMuestrasDirimentesByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [MuestrasDirimentes]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
