IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [AnalistaLaboratorio] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDAnalistaLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
