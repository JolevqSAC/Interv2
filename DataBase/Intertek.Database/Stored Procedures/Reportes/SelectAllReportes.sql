IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllReportes]
GO

CREATE PROCEDURE [dbo].[SelectAllReportes]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDReportes],
	[IDCoordenadasReportes],
	[IDLaboratorio],
	[REP_Nombre]
	FROM [Reportes]

	SET NOCOUNT OFF
END

GO
