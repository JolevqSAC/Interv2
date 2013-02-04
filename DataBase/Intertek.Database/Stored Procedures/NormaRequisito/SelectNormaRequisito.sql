IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaRequisito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectNormaRequisito]
GO

CREATE PROCEDURE [dbo].[SelectNormaRequisito]
(
	@IDNormaRequisito int
)
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
	WHERE [IDNormaRequisito] = @IDNormaRequisito

	SET NOCOUNT OFF
END

GO
