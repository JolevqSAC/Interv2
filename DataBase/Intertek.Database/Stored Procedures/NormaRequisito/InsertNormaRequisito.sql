IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertNormaRequisito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertNormaRequisito]
GO

CREATE PROCEDURE [dbo].[InsertNormaRequisito]
(
	@IDNormaRequisito int OUT,
	@NRE_Codigo varchar(10),
	@NRE_Nombre varchar(200),
	@NRE_Anio int,
	@NRE_Acreditador varchar(120),
	@NRE_Descripcion varchar(200),
	@NRE_Estado varchar(1),
	@NRE_UsuarioCreacion varchar(25),
	@NRE_FechaHoraCreacion datetime,
	@NRE_UsuarioModificacion varchar(25),
	@NRE_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [NormaRequisito] ([NRE_Codigo], [NRE_Nombre], [NRE_Anio], [NRE_Acreditador], [NRE_Descripcion], [NRE_Estado], [NRE_UsuarioCreacion], [NRE_FechaHoraCreacion], [NRE_UsuarioModificacion], [NRE_FechaHoraModificacion]) 
	VALUES (@NRE_Codigo, @NRE_Nombre, @NRE_Anio, @NRE_Acreditador, @NRE_Descripcion, @NRE_Estado, @NRE_UsuarioCreacion, @NRE_FechaHoraCreacion, @NRE_UsuarioModificacion, @NRE_FechaHoraModificacion)

	SET @IDNormaRequisito = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
