IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectMuestrasDirimentesByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectMuestrasDirimentesByIDPER]
GO

CREATE PROCEDURE [dbo].[SelectMuestrasDirimentesByIDPER]
(
	@IDPER int
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
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
