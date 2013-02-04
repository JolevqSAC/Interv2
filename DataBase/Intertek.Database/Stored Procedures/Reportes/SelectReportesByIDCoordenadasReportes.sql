IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectReportesByIDCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectReportesByIDCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[SelectReportesByIDCoordenadasReportes]
(
	@IDCoordenadasReportes int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDReportes],
	[IDCoordenadasReportes],
	[IDLaboratorio],
	[REP_Nombre]
	FROM [Reportes]
	WHERE [IDCoordenadasReportes] = @IDCoordenadasReportes

	SET NOCOUNT OFF
END

GO
