IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLugarMuestreoByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLugarMuestreoByIDCliente]
GO

CREATE PROCEDURE [dbo].[DeleteLugarMuestreoByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [LugarMuestreo]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
