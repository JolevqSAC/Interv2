IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateEnsayo]
(
	@IDEnsayo int,
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

	UPDATE [Ensayo]
	SET [ENS_Codigo] = @ENS_Codigo, 
		[ENS_Nombre] = @ENS_Nombre, 
		[ENS_NombreIngles] = @ENS_NombreIngles, 
		[ENS_Estado] = @ENS_Estado, 
		[IDLaboratorio] = @IDLaboratorio, 
		[ENS_Descripcion] = @ENS_Descripcion, 
		[ENS_UsuarioCreacion] = @ENS_UsuarioCreacion, 
		[ENS_FechaHoraCreacion] = @ENS_FechaHoraCreacion, 
		[ENS_UsuarioModificacion] = @ENS_UsuarioModificacion, 
		[ENS_FechaHoraModificacion] = @ENS_FechaHoraModificacion
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
