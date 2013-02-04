IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCentroCosto]
GO

CREATE PROCEDURE [dbo].[InsertCentroCosto]
(
	@IDCentroCosto int OUT,
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

	INSERT INTO [CentroCosto] ([CCO_Codigo], [CCO_Nombre], [CCO_Descripcion], [CCO_Estado], [CCO_UsuarioCreacion], [CCO_FechaHoraCreacion], [CCO_UsuarioModificacion], [CCO_FechaHoraModificacion]) 
	VALUES (@CCO_Codigo, @CCO_Nombre, @CCO_Descripcion, @CCO_Estado, @CCO_UsuarioCreacion, @CCO_FechaHoraCreacion, @CCO_UsuarioModificacion, @CCO_FechaHoraModificacion)

	SET @IDCentroCosto = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
