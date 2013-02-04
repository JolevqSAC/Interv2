IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlSalidaReactivoByIDLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectControlSalidaReactivoByIDLabSE]
GO

CREATE PROCEDURE [dbo].[SelectControlSalidaReactivoByIDLabSE]
(
	@IDLabSE int
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
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
