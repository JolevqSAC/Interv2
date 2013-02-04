IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEnsayoMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEnsayoMetodo]
GO

CREATE PROCEDURE [dbo].[SelectAllEnsayoMetodo]

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

	SET NOCOUNT OFF
END

GO
