IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCotizacionByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCotizacionByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteCotizacionByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cotizacion]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
