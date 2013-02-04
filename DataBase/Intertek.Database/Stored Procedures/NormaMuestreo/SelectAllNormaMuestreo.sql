IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllNormaMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllNormaMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectAllNormaMuestreo]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDNormaMuestreo],
	[NOM_Codigo],
	[NOM_Nombre],
	[NOM_Acreditador],
	[NOM_Anio],
	[NOM_Descripcion],
	[NOM_Estado],
	[NOM_UsuarioCreacion],
	[NOM_FechaHoraCreacion],
	[NOM_UsuarioModificacion],
	[NOM_FechaHoraModificacion]
	FROM [NormaMuestreo]

	SET NOCOUNT OFF
END

GO
