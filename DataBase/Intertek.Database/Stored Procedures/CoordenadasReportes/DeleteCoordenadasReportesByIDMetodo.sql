IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCoordenadasReportesByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCoordenadasReportesByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteCoordenadasReportesByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CoordenadasReportes]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
