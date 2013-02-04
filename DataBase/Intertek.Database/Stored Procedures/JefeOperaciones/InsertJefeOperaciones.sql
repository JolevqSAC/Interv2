IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[InsertJefeOperaciones]
(
	@IDJefeOperaciones int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [JefeOperaciones] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDJefeOperaciones = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
