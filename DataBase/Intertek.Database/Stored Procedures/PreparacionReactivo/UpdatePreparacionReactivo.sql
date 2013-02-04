IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdatePreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdatePreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[UpdatePreparacionReactivo]
(
	@IDPreparacionReactivo int,
	@IDPersonal int,
	@REP_Codigo char(18),
	@REP_Nombre char(18),
	@REP_VolumenPeso char(18),
	@REP_TemperaturaTiempo char(18),
	@REP_Observaciones char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [PreparacionReactivo]
	SET [IDPersonal] = @IDPersonal, 
		[REP_Codigo] = @REP_Codigo, 
		[REP_Nombre] = @REP_Nombre, 
		[REP_VolumenPeso] = @REP_VolumenPeso, 
		[REP_TemperaturaTiempo] = @REP_TemperaturaTiempo, 
		[REP_Observaciones] = @REP_Observaciones
	WHERE [IDPreparacionReactivo] = @IDPreparacionReactivo

	SET NOCOUNT OFF
END

GO
