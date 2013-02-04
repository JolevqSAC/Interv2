IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDireccionCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDireccionCliente]
GO

CREATE PROCEDURE [dbo].[DeleteDireccionCliente]
(
	@IDDireccionCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [DireccionCliente]
	WHERE [IDDireccionCliente] = @IDDireccionCliente

	SET NOCOUNT OFF
END

GO
