IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateTipoLaboratorio]
(
	@IDTipoLaboratorio int,
	@TLA_Nombre varchar(100),
	@TLA_Estado varchar(1),
	@TLA_UsuarioCreacion varchar(25),
	@TLA_FechaHoraCreacion datetime,
	@TLA_UsuarioModificacion varchar(25),
	@TLA_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [TipoLaboratorio]
	SET [TLA_Nombre] = @TLA_Nombre, 
		[TLA_Estado] = @TLA_Estado, 
		[TLA_UsuarioCreacion] = @TLA_UsuarioCreacion, 
		[TLA_FechaHoraCreacion] = @TLA_FechaHoraCreacion, 
		[TLA_UsuarioModificacion] = @TLA_UsuarioModificacion, 
		[TLA_FechaHoraModificacion] = @TLA_FechaHoraModificacion
	WHERE [IDTipoLaboratorio] = @IDTipoLaboratorio

	SET NOCOUNT OFF
END

GO
