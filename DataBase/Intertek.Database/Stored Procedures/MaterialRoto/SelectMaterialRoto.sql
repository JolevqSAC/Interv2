IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMaterialRoto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectMaterialRoto]
GO

CREATE PROCEDURE [dbo].[SelectMaterialRoto]
(
	@IDMaterialRoto int
)
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
	WHERE [IDMaterialRoto] = @IDMaterialRoto

	SET NOCOUNT OFF
END

GO
