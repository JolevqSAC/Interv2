IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDepartamentoByIDPais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDepartamentoByIDPais]
GO

CREATE PROCEDURE [dbo].[DeleteDepartamentoByIDPais]
(
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Departamento]
	WHERE [IDPais] = @IDPais

	SET NOCOUNT OFF
END

GO
