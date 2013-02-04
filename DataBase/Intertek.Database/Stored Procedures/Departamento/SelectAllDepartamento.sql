IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllDepartamento]
GO

CREATE PROCEDURE [dbo].[SelectAllDepartamento]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDepartamento],
	[DEP_Nombre],
	[IDPais]
	FROM [Departamento]

	SET NOCOUNT OFF
END

GO
