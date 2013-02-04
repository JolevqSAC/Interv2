IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllNormaRequisito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllNormaRequisito]
GO

CREATE PROCEDURE [dbo].[SelectAllNormaRequisito]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDNormaRequisito],
	[NRE_Codigo],
	[NRE_Nombre],
	[NRE_Anio],
	[NRE_Acreditador],
	[NRE_Descripcion],
	[NRE_Estado],
	[NRE_UsuarioCreacion],
	[NRE_FechaHoraCreacion],
	[NRE_UsuarioModificacion],
	[NRE_FechaHoraModificacion]
	FROM [NormaRequisito]

	SET NOCOUNT OFF
END

GO
