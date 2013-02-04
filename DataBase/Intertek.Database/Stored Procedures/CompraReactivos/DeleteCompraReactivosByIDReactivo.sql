IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCompraReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCompraReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteCompraReactivosByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CompraReactivos]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
