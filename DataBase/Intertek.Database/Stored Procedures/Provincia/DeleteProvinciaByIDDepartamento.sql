IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProvinciaByIDDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProvinciaByIDDepartamento]
GO

CREATE PROCEDURE [dbo].[DeleteProvinciaByIDDepartamento]
(
	@IDDepartamento int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Provincia]
	WHERE [IDDepartamento] = @IDDepartamento

	SET NOCOUNT OFF
END

GO
