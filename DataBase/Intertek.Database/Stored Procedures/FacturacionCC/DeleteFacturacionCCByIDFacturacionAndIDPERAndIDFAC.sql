IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacionCCByIDFacturacionAndIDPERAndIDFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacionCCByIDFacturacionAndIDPERAndIDFAC]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacionCCByIDFacturacionAndIDPERAndIDFAC]
(
	@IDFacturacion int,
	@IDPER int,
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [FacturacionCC]
	WHERE [IDFacturacion] = @IDFacturacion AND [IDPER] = @IDPER AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
