IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSubEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSubEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertSubEnsayo]
(
	@IDSubEnsayo int OUT,
	@SEN_Codigo varchar(10),
	@SEN_Nombre varchar(100),
	@SEN_NombreIngles varchar(100),
	@IDEnsayo int,
	@SEN_Estado varchar(1),
	@SEN_UsuarioCreacion varchar(25),
	@SEN_FechaHoraCreacion datetime,
	@SEN_UsuarioModificacion varchar(25),
	@SEN_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [SubEnsayo] ([SEN_Codigo], [SEN_Nombre], [SEN_NombreIngles], [IDEnsayo], [SEN_Estado], [SEN_UsuarioCreacion], [SEN_FechaHoraCreacion], [SEN_UsuarioModificacion], [SEN_FechaHoraModificacion]) 
	VALUES (@SEN_Codigo, @SEN_Nombre, @SEN_NombreIngles, @IDEnsayo, @SEN_Estado, @SEN_UsuarioCreacion, @SEN_FechaHoraCreacion, @SEN_UsuarioModificacion, @SEN_FechaHoraModificacion)

	SET @IDSubEnsayo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
