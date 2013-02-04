IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteContactoCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteContactoCliente]
GO

CREATE PROCEDURE [dbo].[DeleteContactoCliente]
(
	@IDContactoCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ContactoCliente]
	WHERE [IDContactoCliente] = @IDContactoCliente

	SET NOCOUNT OFF
END

GO
