IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertTipoLaboratorio]
(
	@IDTipoLaboratorio int OUT,
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

	INSERT INTO [TipoLaboratorio] ([TLA_Nombre], [TLA_Estado], [TLA_UsuarioCreacion], [TLA_FechaHoraCreacion], [TLA_UsuarioModificacion], [TLA_FechaHoraModificacion]) 
	VALUES (@TLA_Nombre, @TLA_Estado, @TLA_UsuarioCreacion, @TLA_FechaHoraCreacion, @TLA_UsuarioModificacion, @TLA_FechaHoraModificacion)

	SET @IDTipoLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
