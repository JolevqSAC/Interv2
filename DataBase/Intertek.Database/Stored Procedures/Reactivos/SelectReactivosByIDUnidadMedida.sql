IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectReactivosByIDUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectReactivosByIDUnidadMedida]
GO

CREATE PROCEDURE [dbo].[SelectReactivosByIDUnidadMedida]
(
	@IDUnidadMedida int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDReactivo],
	[IDUnidadMedida],
	[REA_Nombre],
	[REA_Marca],
	[REA_NumLote],
	[REA_Grado],
	[REA_Controlado],
	[REA_Presentacion],
	[REA_Seguridad],
	[REA_Localizacion],
	[REA_Estado],
	[REA_Clasifiacion],
	[REA_FechaVencimiento]
	FROM [Reactivos]
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
