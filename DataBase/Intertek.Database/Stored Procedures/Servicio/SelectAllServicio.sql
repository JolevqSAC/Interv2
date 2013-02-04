IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllServicio]
GO

CREATE PROCEDURE [dbo].[SelectAllServicio]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDServicio],
	[SER_Codigo],
	[SER_Nombre],
	[SER_NombreIngles],
	[SER_Descripcion],
	[SER_Estado],
	[SER_UsuarioCreacion],
	[SER_FechaHoraCreacion],
	[SER_UsuarioModificacion],
	[SER_FechaHoraModificacion]
	FROM [Servicio]

	SET NOCOUNT OFF
END

GO
