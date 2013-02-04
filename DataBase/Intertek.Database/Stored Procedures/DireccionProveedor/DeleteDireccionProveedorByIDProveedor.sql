IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDireccionProveedorByIDProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDireccionProveedorByIDProveedor]
GO

CREATE PROCEDURE [dbo].[DeleteDireccionProveedorByIDProveedor]
(
	@IDProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [DireccionProveedor]
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
