IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[SelectAllMuestrasDirimentes]

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

	SET NOCOUNT OFF
END

GO
