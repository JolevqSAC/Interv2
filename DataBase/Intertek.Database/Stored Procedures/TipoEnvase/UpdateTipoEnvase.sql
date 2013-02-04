IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateTipoEnvase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateTipoEnvase]
GO

CREATE PROCEDURE [dbo].[UpdateTipoEnvase]
(
	@IDTiposEnvase int,
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

	UPDATE [TipoEnvase]
	SET [TIE_Descripcion] = @TIE_Descripcion, 
		[TIE_Estado] = @TIE_Estado, 
		[TIE_UsuarioCreacion] = @TIE_UsuarioCreacion, 
		[TIE_FechaHoraCreacion] = @TIE_FechaHoraCreacion, 
		[TIE_UsuarioModificacion] = @TIE_UsuarioModificacion, 
		[TIE_FechaHoraModificacion] = @TIE_FechaHoraModificacion
	WHERE [IDTiposEnvase] = @IDTiposEnvase

	SET NOCOUNT OFF
END

GO
