IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllProvincia]
GO

CREATE PROCEDURE [dbo].[SelectAllProvincia]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDProvincia],
	[IDDepartamento],
	[PRO_Nombre]
	FROM [Provincia]

	SET NOCOUNT OFF
END

GO
