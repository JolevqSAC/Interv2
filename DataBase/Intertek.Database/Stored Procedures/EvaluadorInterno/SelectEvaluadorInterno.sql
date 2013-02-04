IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[SelectEvaluadorInterno]
(
	@IDEvaluadorInterno int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorInterno],
	[IDPersonal]
	FROM [EvaluadorInterno]
	WHERE [IDEvaluadorInterno] = @IDEvaluadorInterno

	SET NOCOUNT OFF
END

GO
