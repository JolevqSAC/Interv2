IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateReportes]
GO

CREATE PROCEDURE [dbo].[UpdateReportes]
(
	@IDReportes int,
	@IDCoordenadasReportes int,
	@IDLaboratorio int,
	@REP_Nombre varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Reportes]
	SET [IDCoordenadasReportes] = @IDCoordenadasReportes, 
		[IDLaboratorio] = @IDLaboratorio, 
		[REP_Nombre] = @REP_Nombre
	WHERE [IDReportes] = @IDReportes

	SET NOCOUNT OFF
END

GO
