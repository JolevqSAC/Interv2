IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[DeleteMuestrasDirimentes]
(
	@IDMuestrasDirimentes int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [MuestrasDirimentes]
	WHERE [IDMuestrasDirimentes] = @IDMuestrasDirimentes

	SET NOCOUNT OFF
END

GO
