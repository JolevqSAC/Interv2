IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllControlSalidaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllControlSalidaReactivo]
GO

CREATE PROCEDURE [dbo].[SelectAllControlSalidaReactivo]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDControlSalidaReactivo],
	[IDReactivo],
	[IDPersonal],
	[IDLabSE],
	[CSR_Cantidad],
	[CSR_Fecha]
	FROM [ControlSalidaReactivo]

	SET NOCOUNT OFF
END

GO
