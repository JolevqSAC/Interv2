IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMaterialRotoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectMaterialRotoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectMaterialRotoByIDPersonal]
(
	@IDPersonal int
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
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
