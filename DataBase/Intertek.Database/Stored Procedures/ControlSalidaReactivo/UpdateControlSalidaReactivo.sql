IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateControlSalidaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateControlSalidaReactivo]
GO

CREATE PROCEDURE [dbo].[UpdateControlSalidaReactivo]
(
	@IDControlSalidaReactivo int,
	@IDReactivo int,
	@IDPersonal int,
	@IDLabSE int,
	@CSR_Cantidad char(18),
	@CSR_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [ControlSalidaReactivo]
	SET [IDReactivo] = @IDReactivo, 
		[IDPersonal] = @IDPersonal, 
		[IDLabSE] = @IDLabSE, 
		[CSR_Cantidad] = @CSR_Cantidad, 
		[CSR_Fecha] = @CSR_Fecha
	WHERE [IDControlSalidaReactivo] = @IDControlSalidaReactivo

	SET NOCOUNT OFF
END

GO
