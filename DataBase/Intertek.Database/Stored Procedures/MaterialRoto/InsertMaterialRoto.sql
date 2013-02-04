IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertMaterialRoto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertMaterialRoto]
GO

CREATE PROCEDURE [dbo].[InsertMaterialRoto]
(
	@IDMaterialRoto int OUT,
	@IDReactivo int,
	@IDPersonal int,
	@MAR_Fecha char(18),
	@MAR_Motivo char(18),
	@MAR_Detalle char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [MaterialRoto] ([IDReactivo], [IDPersonal], [MAR_Fecha], [MAR_Motivo], [MAR_Detalle]) 
	VALUES (@IDReactivo, @IDPersonal, @MAR_Fecha, @MAR_Motivo, @MAR_Detalle)

	SET @IDMaterialRoto = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
