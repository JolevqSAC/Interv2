IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacionCC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacionCC]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacionCC]
(
	@IDEnsayo int,
	@IDPER int,
	@IDFacturacion int,
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [FacturacionCC]
	WHERE [IDEnsayo] = @IDEnsayo AND [IDPER] = @IDPER AND [IDFacturacion] = @IDFacturacion AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
