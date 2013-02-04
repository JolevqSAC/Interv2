IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacionCC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectFacturacionCC]
GO

CREATE PROCEDURE [dbo].[SelectFacturacionCC]
(
	@IDEnsayo int,
	@IDPER int,
	@IDFacturacion int,
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
	WHERE [IDEnsayo] = @IDEnsayo AND [IDPER] = @IDPER AND [IDFacturacion] = @IDFacturacion AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
