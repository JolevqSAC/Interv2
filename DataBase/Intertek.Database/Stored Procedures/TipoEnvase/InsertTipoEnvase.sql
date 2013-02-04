IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertTipoEnvase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertTipoEnvase]
GO

CREATE PROCEDURE [dbo].[InsertTipoEnvase]
(
	@IDTiposEnvase int OUT,
	@TIE_Descripcion varchar(50),
	@TIE_Estado varchar(1),
	@TIE_UsuarioCreacion varchar(25),
	@TIE_FechaHoraCreacion datetime,
	@TIE_UsuarioModificacion varchar(25),
	@TIE_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [TipoEnvase] ([TIE_Descripcion], [TIE_Estado], [TIE_UsuarioCreacion], [TIE_FechaHoraCreacion], [TIE_UsuarioModificacion], [TIE_FechaHoraModificacion]) 
	VALUES (@TIE_Descripcion, @TIE_Estado, @TIE_UsuarioCreacion, @TIE_FechaHoraCreacion, @TIE_UsuarioModificacion, @TIE_FechaHoraModificacion)

	SET @IDTiposEnvase = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
