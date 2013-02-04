IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectMetodo]
GO

CREATE PROCEDURE [dbo].[SelectMetodo]
(
	@IDMetodo int
)
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
