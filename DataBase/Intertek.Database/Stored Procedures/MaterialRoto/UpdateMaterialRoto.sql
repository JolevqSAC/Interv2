IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateMaterialRoto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateMaterialRoto]
GO

CREATE PROCEDURE [dbo].[UpdateMaterialRoto]
(
	@IDMaterialRoto int,
	@IDReactivo int,
	@IDPersonal int,
	@MAR_Fecha char(18),
	@MAR_Motivo char(18),
	@MAR_Detalle char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [MaterialRoto]
	SET [IDReactivo] = @IDReactivo, 
		[IDPersonal] = @IDPersonal, 
		[MAR_Fecha] = @MAR_Fecha, 
		[MAR_Motivo] = @MAR_Motivo, 
		[MAR_Detalle] = @MAR_Detalle
	WHERE [IDMaterialRoto] = @IDMaterialRoto

	SET NOCOUNT OFF
END

GO
