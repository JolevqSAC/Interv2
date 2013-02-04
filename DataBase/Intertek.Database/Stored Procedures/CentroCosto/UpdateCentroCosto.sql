IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCentroCosto]
GO

CREATE PROCEDURE [dbo].[UpdateCentroCosto]
(
	@IDCentroCosto int,
	@CCO_Codigo varchar(10),
	@CCO_Nombre varchar(50),
	@CCO_Descripcion varchar(200),
	@CCO_Estado varchar(1),
	@CCO_UsuarioCreacion varchar(25),
	@CCO_FechaHoraCreacion datetime,
	@CCO_UsuarioModificacion varchar(25),
	@CCO_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CentroCosto]
	SET [CCO_Codigo] = @CCO_Codigo, 
		[CCO_Nombre] = @CCO_Nombre, 
		[CCO_Descripcion] = @CCO_Descripcion, 
		[CCO_Estado] = @CCO_Estado, 
		[CCO_UsuarioCreacion] = @CCO_UsuarioCreacion, 
		[CCO_FechaHoraCreacion] = @CCO_FechaHoraCreacion, 
		[CCO_UsuarioModificacion] = @CCO_UsuarioModificacion, 
		[CCO_FechaHoraModificacion] = @CCO_FechaHoraModificacion
	WHERE [IDCentroCosto] = @IDCentroCosto

	SET NOCOUNT OFF
END

GO
