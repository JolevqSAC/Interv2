IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [AsistenteLaboratorio] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDAsistenteLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
