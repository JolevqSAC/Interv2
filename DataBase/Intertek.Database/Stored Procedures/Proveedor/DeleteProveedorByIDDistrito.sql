IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProveedorByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProveedorByIDDistrito]
GO

CREATE PROCEDURE [dbo].[DeleteProveedorByIDDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Proveedor]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
