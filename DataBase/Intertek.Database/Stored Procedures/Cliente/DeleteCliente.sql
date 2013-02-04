IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCliente]
GO

CREATE PROCEDURE [dbo].[DeleteCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cliente]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
