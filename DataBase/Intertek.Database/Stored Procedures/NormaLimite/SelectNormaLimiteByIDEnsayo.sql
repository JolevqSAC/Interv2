IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaLimiteByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectNormaLimiteByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectNormaLimiteByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
