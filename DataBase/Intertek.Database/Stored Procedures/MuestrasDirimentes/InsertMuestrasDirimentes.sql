IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[InsertMuestrasDirimentes]
(
	@IDMuestrasDirimentes int OUT,
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

	INSERT INTO [MuestrasDirimentes] ([IDPER], [MUD_FechaEnvio], [MUD_Cantidad], [MUD_FechaEliminacion], [MUD_Comentarios], [MUD_Eliminada]) 
	VALUES (@IDPER, @MUD_FechaEnvio, @MUD_Cantidad, @MUD_FechaEliminacion, @MUD_Comentarios, @MUD_Eliminada)

	SET @IDMuestrasDirimentes = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
