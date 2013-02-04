IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateNormaRequisito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateNormaRequisito]
GO

CREATE PROCEDURE [dbo].[UpdateNormaRequisito]
(
	@IDNormaRequisito int,
	@NRE_Codigo varchar(10),
	@NRE_Nombre varchar(200),
	@NRE_Anio int,
	@NRE_Acreditador varchar(120),
	@NRE_Descripcion varchar(200),
	@NRE_Estado varchar(1),
	@NRE_UsuarioCreacion varchar(25),
	@NRE_FechaHoraCreacion datetime,
	@NRE_UsuarioModificacion varchar(25),
	@NRE_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [NormaRequisito]
	SET [NRE_Codigo] = @NRE_Codigo, 
		[NRE_Nombre] = @NRE_Nombre, 
		[NRE_Anio] = @NRE_Anio, 
		[NRE_Acreditador] = @NRE_Acreditador, 
		[NRE_Descripcion] = @NRE_Descripcion, 
		[NRE_Estado] = @NRE_Estado, 
		[NRE_UsuarioCreacion] = @NRE_UsuarioCreacion, 
		[NRE_FechaHoraCreacion] = @NRE_FechaHoraCreacion, 
		[NRE_UsuarioModificacion] = @NRE_UsuarioModificacion, 
		[NRE_FechaHoraModificacion] = @NRE_FechaHoraModificacion
	WHERE [IDNormaRequisito] = @IDNormaRequisito

	SET NOCOUNT OFF
END

GO
