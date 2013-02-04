IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[InsertEvaluadorInterno]
(
	@IDEvaluadorInterno int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [EvaluadorInterno] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDEvaluadorInterno = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
