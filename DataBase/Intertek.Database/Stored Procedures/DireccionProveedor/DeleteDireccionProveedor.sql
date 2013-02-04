IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDireccionProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDireccionProveedor]
GO

CREATE PROCEDURE [dbo].[DeleteDireccionProveedor]
(
	@IDDireccionProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [DireccionProveedor]
	WHERE [IDDireccionProveedor] = @IDDireccionProveedor

	SET NOCOUNT OFF
END

GO
