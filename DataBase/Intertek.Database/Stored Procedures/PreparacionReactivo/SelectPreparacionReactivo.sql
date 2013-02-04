IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[SelectPreparacionReactivo]
(
	@IDPreparacionReactivo int
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
	WHERE [IDPreparacionReactivo] = @IDPreparacionReactivo

	SET NOCOUNT OFF
END

GO
