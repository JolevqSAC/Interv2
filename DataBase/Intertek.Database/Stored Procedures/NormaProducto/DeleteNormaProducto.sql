IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaProducto]
GO

CREATE PROCEDURE [dbo].[DeleteNormaProducto]
(
	@IDNorma int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaProducto]
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
