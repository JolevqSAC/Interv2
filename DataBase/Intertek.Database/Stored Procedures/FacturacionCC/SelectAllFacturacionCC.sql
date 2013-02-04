IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllFacturacionCC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllFacturacionCC]
GO

CREATE PROCEDURE [dbo].[SelectAllFacturacionCC]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayo],
	[IDPER],
	[IDFacturacion],
	[IDFAC],
	[IDCentroCosto]
	FROM [FacturacionCC]

	SET NOCOUNT OFF
END

GO
