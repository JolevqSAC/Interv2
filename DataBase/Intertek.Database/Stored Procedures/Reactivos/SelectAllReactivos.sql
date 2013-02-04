IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllReactivos]
GO

CREATE PROCEDURE [dbo].[SelectAllReactivos]

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

	SET NOCOUNT OFF
END

GO
