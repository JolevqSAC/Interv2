IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectRol]
GO

CREATE PROCEDURE [dbo].[SelectRol]
(
	@IDRol int
)
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
	WHERE [IDRol] = @IDRol

	SET NOCOUNT OFF
END

GO
