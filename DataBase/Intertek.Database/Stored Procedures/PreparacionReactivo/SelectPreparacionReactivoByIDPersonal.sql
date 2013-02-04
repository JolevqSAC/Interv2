IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectPreparacionReactivoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectPreparacionReactivoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectPreparacionReactivoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPreparacionReactivo],
	[IDPersonal],
	[REP_Codigo],
	[REP_Nombre],
	[REP_VolumenPeso],
	[REP_TemperaturaTiempo],
	[REP_Observaciones]
	FROM [PreparacionReactivo]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
