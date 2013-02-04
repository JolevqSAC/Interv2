IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllMaterialRoto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllMaterialRoto]
GO

CREATE PROCEDURE [dbo].[SelectAllMaterialRoto]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDMaterialRoto],
	[IDReactivo],
	[IDPersonal],
	[MAR_Fecha],
	[MAR_Motivo],
	[MAR_Detalle]
	FROM [MaterialRoto]

	SET NOCOUNT OFF
END

GO
