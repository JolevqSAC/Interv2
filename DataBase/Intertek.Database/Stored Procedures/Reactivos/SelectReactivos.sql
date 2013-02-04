IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectReactivos]
GO

CREATE PROCEDURE [dbo].[SelectReactivos]
(
	@IDReactivo int
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
