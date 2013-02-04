IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaLimiteByIDNorma]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectNormaLimiteByIDNorma]
GO

CREATE PROCEDURE [dbo].[SelectNormaLimiteByIDNorma]
(
	@IDNorma int
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
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
