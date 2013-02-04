IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaLimite]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectNormaLimite]
GO

CREATE PROCEDURE [dbo].[SelectNormaLimite]
(
	@IDNormaLimite int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDNormaLimite],
	[IDEnsayo],
	[IDMetodo],
	[IDNorma],
	[NOL_Minimo],
	[NOL_Maximo],
	[NOL_Forma]
	FROM [NormaLimite]
	WHERE [IDNormaLimite] = @IDNormaLimite

	SET NOCOUNT OFF
END

GO
