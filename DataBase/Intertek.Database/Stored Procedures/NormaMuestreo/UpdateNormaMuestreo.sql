IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateNormaMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateNormaMuestreo]
GO

CREATE PROCEDURE [dbo].[UpdateNormaMuestreo]
(
	@IDNormaMuestreo int,
	@NOM_Codigo varchar(10),
	@NOM_Nombre varchar(100),
	@NOM_Acreditador varchar(150),
	@NOM_Anio int,
	@NOM_Descripcion varchar(200),
	@NOM_Estado varchar(1),
	@NOM_UsuarioCreacion varchar(25),
	@NOM_FechaHoraCreacion datetime,
	@NOM_UsuarioModificacion varchar(25),
	@NOM_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [NormaMuestreo]
	SET [NOM_Codigo] = @NOM_Codigo, 
		[NOM_Nombre] = @NOM_Nombre, 
		[NOM_Acreditador] = @NOM_Acreditador, 
		[NOM_Anio] = @NOM_Anio, 
		[NOM_Descripcion] = @NOM_Descripcion, 
		[NOM_Estado] = @NOM_Estado, 
		[NOM_UsuarioCreacion] = @NOM_UsuarioCreacion, 
		[NOM_FechaHoraCreacion] = @NOM_FechaHoraCreacion, 
		[NOM_UsuarioModificacion] = @NOM_UsuarioModificacion, 
		[NOM_FechaHoraModificacion] = @NOM_FechaHoraModificacion
	WHERE [IDNormaMuestreo] = @IDNormaMuestreo

	SET NOCOUNT OFF
END

GO
