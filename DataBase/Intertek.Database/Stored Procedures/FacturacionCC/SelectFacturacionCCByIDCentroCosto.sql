IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacionCCByIDCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectFacturacionCCByIDCentroCosto]
GO

CREATE PROCEDURE [dbo].[SelectFacturacionCCByIDCentroCosto]
(
	@IDCentroCosto int
)
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
	WHERE [IDCentroCosto] = @IDCentroCosto

	SET NOCOUNT OFF
END

GO
