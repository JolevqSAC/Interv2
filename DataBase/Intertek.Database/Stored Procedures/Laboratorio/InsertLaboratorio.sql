IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertLaboratorio]
(
	@IDLaboratorio int OUT,
	@LAB_Nombre varchar(100),
	@IDTipoLaboratorio int,
	@LAB_Estado varchar(1),
	@LAB_UsuarioCreacion varchar(25),
	@LAB_FechaHoraCreacion datetime,
	@LAB_UsuarioModificacion varchar(25),
	@LAB_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Laboratorio] ([LAB_Nombre], [IDTipoLaboratorio], [LAB_Estado], [LAB_UsuarioCreacion], [LAB_FechaHoraCreacion], [LAB_UsuarioModificacion], [LAB_FechaHoraModificacion]) 
	VALUES (@LAB_Nombre, @IDTipoLaboratorio, @LAB_Estado, @LAB_UsuarioCreacion, @LAB_FechaHoraCreacion, @LAB_UsuarioModificacion, @LAB_FechaHoraModificacion)

	SET @IDLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
