IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectUnidadMedida]
GO

CREATE PROCEDURE [dbo].[SelectUnidadMedida]
(
	@IDUnidadMedida int
)
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
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
