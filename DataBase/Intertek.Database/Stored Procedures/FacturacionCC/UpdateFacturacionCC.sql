IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateFacturacionCC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateFacturacionCC]
GO

CREATE PROCEDURE [dbo].[UpdateFacturacionCC]
(
	@IDEnsayo int,
	@IDPER int,
	@IDFacturacion int,
	@IDFAC int,
	@IDCentroCosto int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [FacturacionCC]
	SET [IDCentroCosto] = @IDCentroCosto
	WHERE [IDEnsayo] = @IDEnsayo AND [IDPER] = @IDPER AND [IDFacturacion] = @IDFacturacion AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
