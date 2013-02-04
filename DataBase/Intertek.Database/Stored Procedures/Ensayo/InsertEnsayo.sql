IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertEnsayo]
(
	@IDEnsayo int OUT,
	@ENS_Codigo varchar(10),
	@ENS_Nombre varchar(100),
	@ENS_NombreIngles varchar(100),
	@ENS_Estado varchar(1),
	@IDLaboratorio int,
	@ENS_Descripcion varchar(400),
	@ENS_UsuarioCreacion varchar(25),
	@ENS_FechaHoraCreacion datetime,
	@ENS_UsuarioModificacion varchar(25),
	@ENS_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Ensayo] ([ENS_Codigo], [ENS_Nombre], [ENS_NombreIngles], [ENS_Estado], [IDLaboratorio], [ENS_Descripcion], [ENS_UsuarioCreacion], [ENS_FechaHoraCreacion], [ENS_UsuarioModificacion], [ENS_FechaHoraModificacion]) 
	VALUES (@ENS_Codigo, @ENS_Nombre, @ENS_NombreIngles, @ENS_Estado, @IDLaboratorio, @ENS_Descripcion, @ENS_UsuarioCreacion, @ENS_FechaHoraCreacion, @ENS_UsuarioModificacion, @ENS_FechaHoraModificacion)

	SET @IDEnsayo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
