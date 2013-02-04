IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllRol]
GO

CREATE PROCEDURE [dbo].[SelectAllRol]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDRol],
	[ROL_Codigo],
	[ROL_Nombre],
	[ROL_NombreIngles],
	[ROL_Descripcion],
	[ROL_Estado],
	[ROL_UsuarioCreacion],
	[ROL_FechaHoraCreacion],
	[ROL_UsuarioModificacion],
	[ROL_FechaHoraModificacion]
	FROM [Rol]

	SET NOCOUNT OFF
END

GO
