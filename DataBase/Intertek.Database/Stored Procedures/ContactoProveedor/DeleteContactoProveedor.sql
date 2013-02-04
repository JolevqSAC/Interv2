IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteContactoProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteContactoProveedor]
GO

CREATE PROCEDURE [dbo].[DeleteContactoProveedor]
(
	@IDContactoProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ContactoProveedor]
	WHERE [IDContactoProveedor] = @IDContactoProveedor

	SET NOCOUNT OFF
END

GO
