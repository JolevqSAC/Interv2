IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateDepartamento]
GO

CREATE PROCEDURE [dbo].[UpdateDepartamento]
(
	@IDDepartamento int,
	@DEP_Nombre varchar(100),
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Departamento]
	SET [DEP_Nombre] = @DEP_Nombre, 
		[IDPais] = @IDPais
	WHERE [IDDepartamento] = @IDDepartamento

	SET NOCOUNT OFF
END

GO
