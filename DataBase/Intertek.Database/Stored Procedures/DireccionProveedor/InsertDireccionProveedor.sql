IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertDireccionProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertDireccionProveedor]
GO

CREATE PROCEDURE [dbo].[InsertDireccionProveedor]
(
	@IDDireccionProveedor int OUT,
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

	INSERT INTO [DireccionProveedor] ([DIP_Codigo], [DIP_Tipo], [DIP_Descripcion], [IDProveedor], [DIP_Estado], [DIP_UsuarioCreacion], [DIP_FechaHoraCreacion], [DIP_UsuarioModificacion], [DIP_FechaHoraModificacion]) 
	VALUES (@DIP_Codigo, @DIP_Tipo, @DIP_Descripcion, @IDProveedor, @DIP_Estado, @DIP_UsuarioCreacion, @DIP_FechaHoraCreacion, @DIP_UsuarioModificacion, @DIP_FechaHoraModificacion)

	SET @IDDireccionProveedor = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
