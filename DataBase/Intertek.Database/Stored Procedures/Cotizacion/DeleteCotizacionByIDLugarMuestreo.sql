IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacionByIDLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacionByIDLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacionByIDLugarMuestreo]
(
	@IDLugarMuestreo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDLugarMuestreo] = @IDLugarMuestreo

	SET NOCOUNT OFF
END

GO
