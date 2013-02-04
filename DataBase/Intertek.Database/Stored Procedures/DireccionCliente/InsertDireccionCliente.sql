IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertDireccionCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertDireccionCliente]
GO

CREATE PROCEDURE [dbo].[InsertDireccionCliente]
(
	@IDDireccionCliente int OUT,
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

	INSERT INTO [DireccionCliente] ([DIC_Codigo], [DIC_Tipo], [DIC_Descripcion], [IDCliente], [DIC_Estado], [DIC_UsuarioCreacion], [DIC_FechaHoraCreacion], [DIC_UsuarioModificacion], [DIC_FechaHoraModificacion]) 
	VALUES (@DIC_Codigo, @DIC_Tipo, @DIC_Descripcion, @IDCliente, @DIC_Estado, @DIC_UsuarioCreacion, @DIC_FechaHoraCreacion, @DIC_UsuarioModificacion, @DIC_FechaHoraModificacion)

	SET @IDDireccionCliente = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
