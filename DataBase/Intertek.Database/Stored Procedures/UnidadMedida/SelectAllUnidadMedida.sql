IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllUnidadMedida]
GO

CREATE PROCEDURE [dbo].[SelectAllUnidadMedida]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDUnidadMedida],
	[UNM_Codigo],
	[UNM_Nombre],
	[UNM_NombreCorto],
	[UNM_Estado],
	[UNM_UsuarioCreacion],
	[UNM_FechaHoraCreacion],
	[UNM_UsuarioModificacion],
	[UNM_FechaHoraModificacion]
	FROM [UnidadMedida]

	SET NOCOUNT OFF
END

GO
