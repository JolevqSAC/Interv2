IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCliente]
GO

CREATE PROCEDURE [dbo].[UpdateCliente]
(
	@IDCliente int,
	@CLI_Codigo varchar(10),
	@CLI_RUC varchar(11),
	@CLI_RazonSocial varchar(150),
	@CLI_Direccion varchar(150),
	@CLI_Telefono1 varchar(20),
	@CLI_Correo varchar(50),
	@CLI_Fax varchar(20),
	@CLI_Observaciones varchar(200),
	@IDDistrito int,
	@CLI_Telefono2 varchar(20),
	@CLI_Estado varchar(1),
	@CLI_IndicadorArea char(1),
	@CLI_UsuarioCreacion varchar(25),
	@CLI_FechaHoraCreacion datetime,
	@CLI_UsuarioModificacion varchar(25),
	@CLI_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Cliente]
	SET [CLI_Codigo] = @CLI_Codigo, 
		[CLI_RUC] = @CLI_RUC, 
		[CLI_RazonSocial] = @CLI_RazonSocial, 
		[CLI_Direccion] = @CLI_Direccion, 
		[CLI_Telefono1] = @CLI_Telefono1, 
		[CLI_Correo] = @CLI_Correo, 
		[CLI_Fax] = @CLI_Fax, 
		[CLI_Observaciones] = @CLI_Observaciones, 
		[IDDistrito] = @IDDistrito, 
		[CLI_Telefono2] = @CLI_Telefono2, 
		[CLI_Estado] = @CLI_Estado, 
		[CLI_IndicadorArea] = @CLI_IndicadorArea, 
		[CLI_UsuarioCreacion] = @CLI_UsuarioCreacion, 
		[CLI_FechaHoraCreacion] = @CLI_FechaHoraCreacion, 
		[CLI_UsuarioModificacion] = @CLI_UsuarioModificacion, 
		[CLI_FechaHoraModificacion] = @CLI_FechaHoraModificacion
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
