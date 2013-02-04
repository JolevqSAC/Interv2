IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDireccionClienteByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDireccionClienteByIDCliente]
GO

CREATE PROCEDURE [dbo].[DeleteDireccionClienteByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [DireccionCliente]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
