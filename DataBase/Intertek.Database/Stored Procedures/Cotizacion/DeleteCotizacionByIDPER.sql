IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacionByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacionByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacionByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
