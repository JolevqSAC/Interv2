IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[InsertPreparacionReactivo]
(
	@IDPreparacionReactivo int OUT,
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

	INSERT INTO [PreparacionReactivo] ([IDPersonal], [REP_Codigo], [REP_Nombre], [REP_VolumenPeso], [REP_TemperaturaTiempo], [REP_Observaciones]) 
	VALUES (@IDPersonal, @REP_Codigo, @REP_Nombre, @REP_VolumenPeso, @REP_TemperaturaTiempo, @REP_Observaciones)

	SET @IDPreparacionReactivo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
