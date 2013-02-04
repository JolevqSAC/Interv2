IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[UpdateEvaluadorInterno]
(
	@IDEvaluadorInterno int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [EvaluadorInterno]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDEvaluadorInterno] = @IDEvaluadorInterno

	SET NOCOUNT OFF
END

GO
