IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertUnidadMedida]
GO

CREATE PROCEDURE [dbo].[InsertUnidadMedida]
(
	@IDUnidadMedida int OUT,
	@UNM_Codigo varchar(10),
	@UNM_Nombre varchar(50),
	@UNM_NombreCorto varchar(5),
	@UNM_Estado varchar(1),
	@UNM_UsuarioCreacion varchar(25),
	@UNM_FechaHoraCreacion datetime,
	@UNM_UsuarioModificacion varchar(25),
	@UNM_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [UnidadMedida] ([UNM_Codigo], [UNM_Nombre], [UNM_NombreCorto], [UNM_Estado], [UNM_UsuarioCreacion], [UNM_FechaHoraCreacion], [UNM_UsuarioModificacion], [UNM_FechaHoraModificacion]) 
	VALUES (@UNM_Codigo, @UNM_Nombre, @UNM_NombreCorto, @UNM_Estado, @UNM_UsuarioCreacion, @UNM_FechaHoraCreacion, @UNM_UsuarioModificacion, @UNM_FechaHoraModificacion)

	SET @IDUnidadMedida = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
