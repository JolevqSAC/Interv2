IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectDepartamento]
GO

CREATE PROCEDURE [dbo].[SelectDepartamento]
(
	@IDDepartamento int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDepartamento],
	[DEP_Nombre],
	[IDPais]
	FROM [Departamento]
	WHERE [IDDepartamento] = @IDDepartamento

	SET NOCOUNT OFF
END

GO
