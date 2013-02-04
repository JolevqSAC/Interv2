IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteContratoByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteContratoByIDCliente]
GO

CREATE PROCEDURE [dbo].[DeleteContratoByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Contrato]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
