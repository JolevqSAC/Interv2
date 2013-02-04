IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMaterialRotoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectMaterialRotoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectMaterialRotoByIDReactivo]
(
	@IDReactivo int
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
