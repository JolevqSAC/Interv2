IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertFacturacionCC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertFacturacionCC]
GO

CREATE PROCEDURE [dbo].[InsertFacturacionCC]
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

	INSERT INTO [FacturacionCC] ([IDEnsayo], [IDPER], [IDFacturacion], [IDFAC], [IDCentroCosto]) 
	VALUES (@IDEnsayo, @IDPER, @IDFacturacion, @IDFAC, @IDCentroCosto)

	SET NOCOUNT OFF
END

GO
