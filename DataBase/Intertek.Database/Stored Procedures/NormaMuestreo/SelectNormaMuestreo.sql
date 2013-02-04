IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectNormaMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectNormaMuestreo]
(
	@IDNormaMuestreo int
)
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
	WHERE [IDNormaMuestreo] = @IDNormaMuestreo

	SET NOCOUNT OFF
END

GO
