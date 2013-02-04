IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllMetodo]
GO

CREATE PROCEDURE [dbo].[SelectAllMetodo]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDMetodo],
	[MET_Codigo],
	[MET_Nombre],
	[MET_NombreIngles],
	[MET_Descripcion],
	[MET_Estado],
	[MET_UsuarioCreacion],
	[MET_FechaHoraCreacion],
	[MET_UsuarioModificacion],
	[MET_FechaHoraModificacion]
	FROM [Metodo]

	SET NOCOUNT OFF
END

GO
