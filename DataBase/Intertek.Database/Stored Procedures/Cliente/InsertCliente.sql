IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCliente]
GO

CREATE PROCEDURE [dbo].[InsertCliente]
(
	@IDCliente int OUT,
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

	INSERT INTO [Cliente] ([CLI_Codigo], [CLI_RUC], [CLI_RazonSocial], [CLI_Direccion], [CLI_Telefono1], [CLI_Correo], [CLI_Fax], [CLI_Observaciones], [IDDistrito], [CLI_Telefono2], [CLI_Estado], [CLI_IndicadorArea], [CLI_UsuarioCreacion], [CLI_FechaHoraCreacion], [CLI_UsuarioModificacion], [CLI_FechaHoraModificacion]) 
	VALUES (@CLI_Codigo, @CLI_RUC, @CLI_RazonSocial, @CLI_Direccion, @CLI_Telefono1, @CLI_Correo, @CLI_Fax, @CLI_Observaciones, @IDDistrito, @CLI_Telefono2, @CLI_Estado, @CLI_IndicadorArea, @CLI_UsuarioCreacion, @CLI_FechaHoraCreacion, @CLI_UsuarioModificacion, @CLI_FechaHoraModificacion)

	SET @IDCliente = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
