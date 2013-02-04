IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertControlSalidaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertControlSalidaReactivo]
GO

CREATE PROCEDURE [dbo].[InsertControlSalidaReactivo]
(
	@IDControlSalidaReactivo int OUT,
	@IDReactivo int,
	@IDPersonal int,
	@IDLabSE int,
	@CSR_Cantidad char(18),
	@CSR_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ControlSalidaReactivo] ([IDReactivo], [IDPersonal], [IDLabSE], [CSR_Cantidad], [CSR_Fecha]) 
	VALUES (@IDReactivo, @IDPersonal, @IDLabSE, @CSR_Cantidad, @CSR_Fecha)

	SET @IDControlSalidaReactivo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
