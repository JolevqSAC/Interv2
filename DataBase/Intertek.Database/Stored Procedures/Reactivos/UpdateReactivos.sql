IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateReactivos]
GO

CREATE PROCEDURE [dbo].[UpdateReactivos]
(
	@IDReactivo int,
	@IDUnidadMedida int,
	@REA_Nombre char(18),
	@REA_Marca char(18),
	@REA_NumLote char(18),
	@REA_Grado char(18),
	@REA_Controlado char(18),
	@REA_Presentacion char(18),
	@REA_Seguridad char(18),
	@REA_Localizacion char(18),
	@REA_Estado char(18),
	@REA_Clasifiacion char(18),
	@REA_FechaVencimiento char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Reactivos]
	SET [IDUnidadMedida] = @IDUnidadMedida, 
		[REA_Nombre] = @REA_Nombre, 
		[REA_Marca] = @REA_Marca, 
		[REA_NumLote] = @REA_NumLote, 
		[REA_Grado] = @REA_Grado, 
		[REA_Controlado] = @REA_Controlado, 
		[REA_Presentacion] = @REA_Presentacion, 
		[REA_Seguridad] = @REA_Seguridad, 
		[REA_Localizacion] = @REA_Localizacion, 
		[REA_Estado] = @REA_Estado, 
		[REA_Clasifiacion] = @REA_Clasifiacion, 
		[REA_FechaVencimiento] = @REA_FechaVencimiento
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
