IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertReactivos]
GO

CREATE PROCEDURE [dbo].[InsertReactivos]
(
	@IDReactivo int OUT,
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

	INSERT INTO [Reactivos] ([IDUnidadMedida], [REA_Nombre], [REA_Marca], [REA_NumLote], [REA_Grado], [REA_Controlado], [REA_Presentacion], [REA_Seguridad], [REA_Localizacion], [REA_Estado], [REA_Clasifiacion], [REA_FechaVencimiento]) 
	VALUES (@IDUnidadMedida, @REA_Nombre, @REA_Marca, @REA_NumLote, @REA_Grado, @REA_Controlado, @REA_Presentacion, @REA_Seguridad, @REA_Localizacion, @REA_Estado, @REA_Clasifiacion, @REA_FechaVencimiento)

	SET @IDReactivo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
