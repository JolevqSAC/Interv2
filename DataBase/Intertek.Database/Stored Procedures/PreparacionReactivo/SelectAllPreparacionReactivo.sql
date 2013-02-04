IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[SelectAllPreparacionReactivo]

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

	SET NOCOUNT OFF
END

GO
