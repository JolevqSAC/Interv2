IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllNormaLimite]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllNormaLimite]
GO

CREATE PROCEDURE [dbo].[SelectAllNormaLimite]

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

	SET NOCOUNT OFF
END

GO
