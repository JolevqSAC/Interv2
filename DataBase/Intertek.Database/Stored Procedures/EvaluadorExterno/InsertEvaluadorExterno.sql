IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[InsertEvaluadorExterno]
(
	@IDEvaluadorExterno int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [EvaluadorExterno] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDEvaluadorExterno = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
