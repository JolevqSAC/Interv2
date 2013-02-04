IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacionCCByIDCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacionCCByIDCentroCosto]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacionCCByIDCentroCosto]
(
	@IDCentroCosto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [FacturacionCC]
	WHERE [IDCentroCosto] = @IDCentroCosto

	SET NOCOUNT OFF
END

GO
