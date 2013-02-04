IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertMetodo]
GO

CREATE PROCEDURE [dbo].[InsertMetodo]
(
	@IDMetodo int OUT,
	@MET_Codigo varchar(10),
	@MET_Nombre varchar(100),
	@MET_NombreIngles varchar(100),
	@MET_Descripcion varchar(200),
	@MET_Estado varchar(1),
	@MET_UsuarioCreacion varchar(25),
	@MET_FechaHoraCreacion datetime,
	@MET_UsuarioModificacion varchar(25),
	@MET_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Metodo] ([MET_Codigo], [MET_Nombre], [MET_NombreIngles], [MET_Descripcion], [MET_Estado], [MET_UsuarioCreacion], [MET_FechaHoraCreacion], [MET_UsuarioModificacion], [MET_FechaHoraModificacion]) 
	VALUES (@MET_Codigo, @MET_Nombre, @MET_NombreIngles, @MET_Descripcion, @MET_Estado, @MET_UsuarioCreacion, @MET_FechaHoraCreacion, @MET_UsuarioModificacion, @MET_FechaHoraModificacion)

	SET @IDMetodo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
