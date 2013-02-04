IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoMetodoByIDMetodo]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoByIDMetodo]
(
	@IDMetodo int
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
