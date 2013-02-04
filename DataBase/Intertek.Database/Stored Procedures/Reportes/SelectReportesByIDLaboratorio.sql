IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectReportesByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectReportesByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectReportesByIDLaboratorio]
(
	@IDLaboratorio int
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
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
