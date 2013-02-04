IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[UpdateLugarMuestreo]
(
	@IDLugarMuestreo int,
	@IDCliente int,
	@LUM_Direccion varchar(150),
	@LUM_Telefono varchar(20),
	@LUM_Contacto varchar(150),
	@LUM_Observaciones varchar(200),
	@LUM_Estado varchar(1),
	@LUM_UsuarioCreacion varchar(25),
	@LUM_FechaHoraCreacion datetime,
	@LUM_UsuarioModificacion varchar(25),
	@LUM_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [LugarMuestreo]
	SET [IDCliente] = @IDCliente, 
		[LUM_Direccion] = @LUM_Direccion, 
		[LUM_Telefono] = @LUM_Telefono, 
		[LUM_Contacto] = @LUM_Contacto, 
		[LUM_Observaciones] = @LUM_Observaciones, 
		[LUM_Estado] = @LUM_Estado, 
		[LUM_UsuarioCreacion] = @LUM_UsuarioCreacion, 
		[LUM_FechaHoraCreacion] = @LUM_FechaHoraCreacion, 
		[LUM_UsuarioModificacion] = @LUM_UsuarioModificacion, 
		[LUM_FechaHoraModificacion] = @LUM_FechaHoraModificacion
	WHERE [IDLugarMuestreo] = @IDLugarMuestreo

	SET NOCOUNT OFF
END

GO
