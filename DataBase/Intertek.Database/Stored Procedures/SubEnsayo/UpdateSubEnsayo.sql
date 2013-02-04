IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSubEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSubEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateSubEnsayo]
(
	@IDSubEnsayo int,
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

	UPDATE [SubEnsayo]
	SET [SEN_Codigo] = @SEN_Codigo, 
		[SEN_Nombre] = @SEN_Nombre, 
		[SEN_NombreIngles] = @SEN_NombreIngles, 
		[IDEnsayo] = @IDEnsayo, 
		[SEN_Estado] = @SEN_Estado, 
		[SEN_UsuarioCreacion] = @SEN_UsuarioCreacion, 
		[SEN_FechaHoraCreacion] = @SEN_FechaHoraCreacion, 
		[SEN_UsuarioModificacion] = @SEN_UsuarioModificacion, 
		[SEN_FechaHoraModificacion] = @SEN_FechaHoraModificacion
	WHERE [IDSubEnsayo] = @IDSubEnsayo

	SET NOCOUNT OFF
END

GO
