IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertJefeLaboratorio]
(
	@IDJefeLaboratorio int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [JefeLaboratorio] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDJefeLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
