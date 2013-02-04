IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[InsertLugarMuestreo]
(
	@IDLugarMuestreo int OUT,
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

	INSERT INTO [LugarMuestreo] ([IDCliente], [LUM_Direccion], [LUM_Telefono], [LUM_Contacto], [LUM_Observaciones], [LUM_Estado], [LUM_UsuarioCreacion], [LUM_FechaHoraCreacion], [LUM_UsuarioModificacion], [LUM_FechaHoraModificacion]) 
	VALUES (@IDCliente, @LUM_Direccion, @LUM_Telefono, @LUM_Contacto, @LUM_Observaciones, @LUM_Estado, @LUM_UsuarioCreacion, @LUM_FechaHoraCreacion, @LUM_UsuarioModificacion, @LUM_FechaHoraModificacion)

	SET @IDLugarMuestreo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
