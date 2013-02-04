IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateDireccionCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateDireccionCliente]
GO

CREATE PROCEDURE [dbo].[UpdateDireccionCliente]
(
	@IDDireccionCliente int,
	@DIC_Codigo varchar(20),
	@DIC_Tipo varchar(20),
	@DIC_Descripcion varchar(200),
	@IDCliente int,
	@DIC_Estado varchar(1),
	@DIC_UsuarioCreacion varchar(25),
	@DIC_FechaHoraCreacion datetime,
	@DIC_UsuarioModificacion varchar(25),
	@DIC_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [DireccionCliente]
	SET [DIC_Codigo] = @DIC_Codigo, 
		[DIC_Tipo] = @DIC_Tipo, 
		[DIC_Descripcion] = @DIC_Descripcion, 
		[IDCliente] = @IDCliente, 
		[DIC_Estado] = @DIC_Estado, 
		[DIC_UsuarioCreacion] = @DIC_UsuarioCreacion, 
		[DIC_FechaHoraCreacion] = @DIC_FechaHoraCreacion, 
		[DIC_UsuarioModificacion] = @DIC_UsuarioModificacion, 
		[DIC_FechaHoraModificacion] = @DIC_FechaHoraModificacion
	WHERE [IDDireccionCliente] = @IDDireccionCliente

	SET NOCOUNT OFF
END

GO
