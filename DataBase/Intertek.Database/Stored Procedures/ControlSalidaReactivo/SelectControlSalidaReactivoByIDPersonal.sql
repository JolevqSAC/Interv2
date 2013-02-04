IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlSalidaReactivoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectControlSalidaReactivoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectControlSalidaReactivoByIDPersonal]
(
	@IDPersonal int
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
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
