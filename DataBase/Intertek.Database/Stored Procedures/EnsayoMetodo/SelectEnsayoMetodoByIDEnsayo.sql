IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoMetodoByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayoMetodo],
	[IDEnsayo],
	[IDMetodo],
	[EME_Acreditado],
	[EME_FechaAcreditado],
	[EME_VersionActual],
	[EME_FechaAsignacion]
	FROM [EnsayoMetodo]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
