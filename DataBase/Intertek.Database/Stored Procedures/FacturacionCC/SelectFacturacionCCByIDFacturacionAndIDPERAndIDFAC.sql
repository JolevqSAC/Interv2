IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacionCCByIDFacturacionAndIDPERAndIDFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectFacturacionCCByIDFacturacionAndIDPERAndIDFAC]
GO

CREATE PROCEDURE [dbo].[SelectFacturacionCCByIDFacturacionAndIDPERAndIDFAC]
(
	@IDFacturacion int,
	@IDPER int,
	@IDFAC int
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
	WHERE [IDFacturacion] = @IDFacturacion AND [IDPER] = @IDPER AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
