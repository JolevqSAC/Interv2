IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProveedor]
GO

CREATE PROCEDURE [dbo].[DeleteProveedor]
(
	@IDProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Proveedor]
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
