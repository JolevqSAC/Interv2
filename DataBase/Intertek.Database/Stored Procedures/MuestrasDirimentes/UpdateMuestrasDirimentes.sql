IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[UpdateMuestrasDirimentes]
(
	@IDMuestrasDirimentes int,
	@IDPER int,
	@MUD_FechaEnvio char(18),
	@MUD_Cantidad char(18),
	@MUD_FechaEliminacion char(18),
	@MUD_Comentarios char(18),
	@MUD_Eliminada char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [MuestrasDirimentes]
	SET [IDPER] = @IDPER, 
		[MUD_FechaEnvio] = @MUD_FechaEnvio, 
		[MUD_Cantidad] = @MUD_Cantidad, 
		[MUD_FechaEliminacion] = @MUD_FechaEliminacion, 
		[MUD_Comentarios] = @MUD_Comentarios, 
		[MUD_Eliminada] = @MUD_Eliminada
	WHERE [IDMuestrasDirimentes] = @IDMuestrasDirimentes

	SET NOCOUNT OFF
END

GO
