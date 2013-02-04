IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertProvincia]
GO

CREATE PROCEDURE [dbo].[InsertProvincia]
(
	@IDProvincia int OUT,
	@IDDepartamento int,
	@PRO_Nombre varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Provincia] ([IDDepartamento], [PRO_Nombre]) 
	VALUES (@IDDepartamento, @PRO_Nombre)

	SET @IDProvincia = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
