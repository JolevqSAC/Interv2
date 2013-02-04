IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProvinciaByIDDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectProvinciaByIDDepartamento]
GO

CREATE PROCEDURE [dbo].[SelectProvinciaByIDDepartamento]
(
	@IDDepartamento int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDProvincia],
	[IDDepartamento],
	[PRO_Nombre]
	FROM [Provincia]
	WHERE [IDDepartamento] = @IDDepartamento

	SET NOCOUNT OFF
END

GO
