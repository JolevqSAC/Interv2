IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertContactoCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertContactoCliente]
GO

CREATE PROCEDURE [dbo].[InsertContactoCliente]
(
	@IDContactoCliente int OUT,
	@COC_Codigo varchar(10),
	@COC_Nombres varchar(100),
	@COC_Apellidos varchar(100),
	@COC_Cargo varchar(100),
	@COC_Telefono1 varchar(20),
	@COC_Telefono2 varchar(20),
	@IDCliente int,
	@COC_Estado varchar(1),
	@COC_UsuarioCreacion varchar(25),
	@COC_FechaHoraCreacion datetime,
	@COC_UsuarioModificacion varchar(25),
	@COC_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ContactoCliente] ([COC_Codigo], [COC_Nombres], [COC_Apellidos], [COC_Cargo], [COC_Telefono1], [COC_Telefono2], [IDCliente], [COC_Estado], [COC_UsuarioCreacion], [COC_FechaHoraCreacion], [COC_UsuarioModificacion], [COC_FechaHoraModificacion]) 
	VALUES (@COC_Codigo, @COC_Nombres, @COC_Apellidos, @COC_Cargo, @COC_Telefono1, @COC_Telefono2, @IDCliente, @COC_Estado, @COC_UsuarioCreacion, @COC_FechaHoraCreacion, @COC_UsuarioModificacion, @COC_FechaHoraModificacion)

	SET @IDContactoCliente = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
