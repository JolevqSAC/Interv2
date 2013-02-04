IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteReportesByIDCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteReportesByIDCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[DeleteReportesByIDCoordenadasReportes]
(
	@IDCoordenadasReportes int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Reportes]
	WHERE [IDCoordenadasReportes] = @IDCoordenadasReportes

	SET NOCOUNT OFF
END

GO
