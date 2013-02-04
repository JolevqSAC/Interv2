IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnaquelMDByIDMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnaquelMDByIDMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[DeleteAnaquelMDByIDMuestrasDirimentes]
(
	@IDMuestrasDirimentes int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AnaquelMD]
	WHERE [IDMuestrasDirimentes] = @IDMuestrasDirimentes

	SET NOCOUNT OFF
END

GO
