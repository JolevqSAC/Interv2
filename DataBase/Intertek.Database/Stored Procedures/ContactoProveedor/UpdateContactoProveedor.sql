IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateContactoProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateContactoProveedor]
GO

CREATE PROCEDURE [dbo].[UpdateContactoProveedor]
(
	@IDContactoProveedor int,
	@COC_Codigo varchar(10),
	@COC_Nombres varchar(100),
	@COC_Apellidos varchar(100),
	@COC_Cargo varchar(100),
	@COC_Telefono1 varchar(20),
	@COC_Telefono2 varchar(20),
	@IDProveedor int,
	@COC_Estado varchar(1),
	@COC_UsuarioCreacion varchar(25),
	@COC_FechaHoraCreacion datetime,
	@COC_UsuarioModificacion varchar(25),
	@COC_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [ContactoProveedor]
	SET [COC_Codigo] = @COC_Codigo, 
		[COC_Nombres] = @COC_Nombres, 
		[COC_Apellidos] = @COC_Apellidos, 
		[COC_Cargo] = @COC_Cargo, 
		[COC_Telefono1] = @COC_Telefono1, 
		[COC_Telefono2] = @COC_Telefono2, 
		[IDProveedor] = @IDProveedor, 
		[COC_Estado] = @COC_Estado, 
		[COC_UsuarioCreacion] = @COC_UsuarioCreacion, 
		[COC_FechaHoraCreacion] = @COC_FechaHoraCreacion, 
		[COC_UsuarioModificacion] = @COC_UsuarioModificacion, 
		[COC_FechaHoraModificacion] = @COC_FechaHoraModificacion
	WHERE [IDContactoProveedor] = @IDContactoProveedor

	SET NOCOUNT OFF
END

GO
