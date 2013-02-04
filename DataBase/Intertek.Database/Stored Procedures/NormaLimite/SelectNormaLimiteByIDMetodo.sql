IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaLimiteByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectNormaLimiteByIDMetodo]
GO

CREATE PROCEDURE [dbo].[SelectNormaLimiteByIDMetodo]
(
	@IDMetodo int
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
