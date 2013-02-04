IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertNormaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertNormaProducto]
GO

CREATE PROCEDURE [dbo].[InsertNormaProducto]
(
	@IDNorma int OUT,
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

	INSERT INTO [NormaProducto] ([IDProducto], [NOR_Nombre], [NOR_Acreditador], [NOR_Anio], [NOR_Observaciones], [NOR_Estado], [NOR_UsuarioCreacion], [NOR_FechaHoraCreacion], [NOR_UsuarioModificacion], [NOR_FechaHoraModificacion]) 
	VALUES (@IDProducto, @NOR_Nombre, @NOR_Acreditador, @NOR_Anio, @NOR_Observaciones, @NOR_Estado, @NOR_UsuarioCreacion, @NOR_FechaHoraCreacion, @NOR_UsuarioModificacion, @NOR_FechaHoraModificacion)

	SET @IDNorma = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
