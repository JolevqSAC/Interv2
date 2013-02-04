IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacionByIDCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacionByIDCOT]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacionByIDCOT]
(
	@IDCOT int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
