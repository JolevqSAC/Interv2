IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDepartamento]
GO

CREATE PROCEDURE [dbo].[DeleteDepartamento]
(
	@IDDepartamento int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Departamento]
	WHERE [IDDepartamento] = @IDDepartamento

	SET NOCOUNT OFF
END

GO
