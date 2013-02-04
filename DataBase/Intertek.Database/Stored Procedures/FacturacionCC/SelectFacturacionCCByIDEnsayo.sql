IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacionCCByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectFacturacionCCByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectFacturacionCCByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
