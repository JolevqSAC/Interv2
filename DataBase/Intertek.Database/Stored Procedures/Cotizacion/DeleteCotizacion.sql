IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacion]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacion]
(
	@IDCotizacion int,
	@IDCOT int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDCotizacion] = @IDCotizacion AND [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
