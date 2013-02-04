IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlSalidaReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectControlSalidaReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectControlSalidaReactivoByIDReactivo]
(
	@IDReactivo int
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
