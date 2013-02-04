IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[DeleteCoordenadasReportes]
(
	@IDCoordenadasReportes int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CoordenadasReportes]
	WHERE [IDCoordenadasReportes] = @IDCoordenadasReportes

	SET NOCOUNT OFF
END

GO
