IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteContactoClienteByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteContactoClienteByIDCliente]
GO

CREATE PROCEDURE [dbo].[DeleteContactoClienteByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ContactoCliente]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
