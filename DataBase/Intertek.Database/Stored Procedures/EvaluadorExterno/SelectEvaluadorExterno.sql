IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[SelectEvaluadorExterno]
(
	@IDEvaluadorExterno int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorExterno],
	[IDPersonal]
	FROM [EvaluadorExterno]
	WHERE [IDEvaluadorExterno] = @IDEvaluadorExterno

	SET NOCOUNT OFF
END

GO
