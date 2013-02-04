IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllArea]
GO

CREATE PROCEDURE [dbo].[SelectAllArea]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDArea],
	[ARE_Codigo],
	[ARE_Nombre],
	[ARE_Descripcion],
	[ARE_Estado],
	[ARE_UsuarioCreaccion],
	[ARE_FechaHoraCreacion],
	[ARE_UsuarioModificacion],
	[ARE_FechaHoraModificacion]
	FROM [Area]

	SET NOCOUNT OFF
END

GO
