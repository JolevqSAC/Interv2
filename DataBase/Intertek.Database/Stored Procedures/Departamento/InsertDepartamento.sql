IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertDepartamento]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertDepartamento]
GO

CREATE PROCEDURE [dbo].[InsertDepartamento]
(
	@IDDepartamento int OUT,
	@DEP_Nombre varchar(100),
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Departamento] ([DEP_Nombre], [IDPais]) 
	VALUES (@DEP_Nombre, @IDPais)

	SET @IDDepartamento = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
