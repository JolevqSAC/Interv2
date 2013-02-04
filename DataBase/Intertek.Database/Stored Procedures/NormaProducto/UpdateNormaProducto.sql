IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateNormaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateNormaProducto]
GO

CREATE PROCEDURE [dbo].[UpdateNormaProducto]
(
	@IDNorma int,
	@IDProducto int,
	@NOR_Nombre varchar(100),
	@NOR_Acreditador varchar(150),
	@NOR_Anio int,
	@NOR_Observaciones varchar(200),
	@NOR_Estado varchar(1),
	@NOR_UsuarioCreacion varchar(25),
	@NOR_FechaHoraCreacion datetime,
	@NOR_UsuarioModificacion varchar(25),
	@NOR_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [NormaProducto]
	SET [IDProducto] = @IDProducto, 
		[NOR_Nombre] = @NOR_Nombre, 
		[NOR_Acreditador] = @NOR_Acreditador, 
		[NOR_Anio] = @NOR_Anio, 
		[NOR_Observaciones] = @NOR_Observaciones, 
		[NOR_Estado] = @NOR_Estado, 
		[NOR_UsuarioCreacion] = @NOR_UsuarioCreacion, 
		[NOR_FechaHoraCreacion] = @NOR_FechaHoraCreacion, 
		[NOR_UsuarioModificacion] = @NOR_UsuarioModificacion, 
		[NOR_FechaHoraModificacion] = @NOR_FechaHoraModificacion
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
