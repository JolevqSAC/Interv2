IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertDistrito]
GO

CREATE PROCEDURE [dbo].[InsertDistrito]
(
	@IDDistrito int OUT,
	@DIS_Nombre varchar(100),
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Distrito] ([DIS_Nombre], [IDProvincia]) 
	VALUES (@DIS_Nombre, @IDProvincia)

	SET @IDDistrito = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
