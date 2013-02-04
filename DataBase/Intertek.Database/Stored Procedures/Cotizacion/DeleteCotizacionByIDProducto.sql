IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacionByIDProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacionByIDProducto]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacionByIDProducto]
(
	@IDProducto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
