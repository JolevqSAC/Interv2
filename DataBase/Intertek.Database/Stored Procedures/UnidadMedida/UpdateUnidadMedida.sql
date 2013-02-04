IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateUnidadMedida]
GO

CREATE PROCEDURE [dbo].[UpdateUnidadMedida]
(
	@IDUnidadMedida int,
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

	UPDATE [UnidadMedida]
	SET [UNM_Codigo] = @UNM_Codigo, 
		[UNM_Nombre] = @UNM_Nombre, 
		[UNM_NombreCorto] = @UNM_NombreCorto, 
		[UNM_Estado] = @UNM_Estado, 
		[UNM_UsuarioCreacion] = @UNM_UsuarioCreacion, 
		[UNM_FechaHoraCreacion] = @UNM_FechaHoraCreacion, 
		[UNM_UsuarioModificacion] = @UNM_UsuarioModificacion, 
		[UNM_FechaHoraModificacion] = @UNM_FechaHoraModificacion
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
