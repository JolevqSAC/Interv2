IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertReportes]
GO

CREATE PROCEDURE [dbo].[InsertReportes]
(
	@IDReportes int OUT,
	@IDCoordenadasReportes int,
	@IDLaboratorio int,
	@REP_Nombre varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Reportes] ([IDCoordenadasReportes], [IDLaboratorio], [REP_Nombre]) 
	VALUES (@IDCoordenadasReportes, @IDLaboratorio, @REP_Nombre)

	SET @IDReportes = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
