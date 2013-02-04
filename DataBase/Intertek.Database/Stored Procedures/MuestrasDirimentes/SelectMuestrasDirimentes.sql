IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[SelectMuestrasDirimentes]
(
	@IDMuestrasDirimentes int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDMuestrasDirimentes],
	[IDPER],
	[MUD_FechaEnvio],
	[MUD_Cantidad],
	[MUD_FechaEliminacion],
	[MUD_Comentarios],
	[MUD_Eliminada]
	FROM [MuestrasDirimentes]
	WHERE [IDMuestrasDirimentes] = @IDMuestrasDirimentes

	SET NOCOUNT OFF
END

GO
