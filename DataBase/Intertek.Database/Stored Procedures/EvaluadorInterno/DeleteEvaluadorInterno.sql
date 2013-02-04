IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[DeleteEvaluadorInterno]
(
	@IDEvaluadorInterno int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EvaluadorInterno]
	WHERE [IDEvaluadorInterno] = @IDEvaluadorInterno

	SET NOCOUNT OFF
END

GO
