IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEnsayoMetodo]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodo]
(
	@IDEnsayoMetodo int
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
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
