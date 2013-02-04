IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDepartamentoByIDPais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectDepartamentoByIDPais]
GO

CREATE PROCEDURE [dbo].[SelectDepartamentoByIDPais]
(
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDepartamento],
	[DEP_Nombre],
	[IDPais]
	FROM [Departamento]
	WHERE [IDPais] = @IDPais

	SET NOCOUNT OFF
END

GO
