IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateDireccionProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateDireccionProveedor]
GO

CREATE PROCEDURE [dbo].[UpdateDireccionProveedor]
(
	@IDDireccionProveedor int,
	@DIP_Codigo varchar(10),
	@DIP_Tipo varchar(20),
	@DIP_Descripcion varchar(200),
	@IDProveedor int,
	@DIP_Estado varchar(1),
	@DIP_UsuarioCreacion varchar(25),
	@DIP_FechaHoraCreacion datetime,
	@DIP_UsuarioModificacion varchar(25),
	@DIP_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [DireccionProveedor]
	SET [DIP_Codigo] = @DIP_Codigo, 
		[DIP_Tipo] = @DIP_Tipo, 
		[DIP_Descripcion] = @DIP_Descripcion, 
		[IDProveedor] = @IDProveedor, 
		[DIP_Estado] = @DIP_Estado, 
		[DIP_UsuarioCreacion] = @DIP_UsuarioCreacion, 
		[DIP_FechaHoraCreacion] = @DIP_FechaHoraCreacion, 
		[DIP_UsuarioModificacion] = @DIP_UsuarioModificacion, 
		[DIP_FechaHoraModificacion] = @DIP_FechaHoraModificacion
	WHERE [IDDireccionProveedor] = @IDDireccionProveedor

	SET NOCOUNT OFF
END

GO
