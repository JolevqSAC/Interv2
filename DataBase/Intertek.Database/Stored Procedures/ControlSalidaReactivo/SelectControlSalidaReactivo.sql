IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlSalidaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectControlSalidaReactivo]
GO

CREATE PROCEDURE [dbo].[SelectControlSalidaReactivo]
(
	@IDControlSalidaReactivo int
)
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
	WHERE [IDControlSalidaReactivo] = @IDControlSalidaReactivo

	SET NOCOUNT OFF
END

GO
