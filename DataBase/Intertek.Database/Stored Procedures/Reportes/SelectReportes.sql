IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectReportes]
GO

CREATE PROCEDURE [dbo].[SelectReportes]
(
	@IDReportes int
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
	WHERE [IDReportes] = @IDReportes

	SET NOCOUNT OFF
END

GO
