IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertPais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertPais]
GO

CREATE PROCEDURE [dbo].[InsertPais]
(
	@IDPais int OUT,
	@PAI_Nombre varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Pais] ([PAI_Nombre]) 
	VALUES (@PAI_Nombre)

	SET @IDPais = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
