IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEvaluadorInterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEvaluadorInterno]
GO

CREATE PROCEDURE [dbo].[SelectAllEvaluadorInterno]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorInterno],
	[IDPersonal]
	FROM [EvaluadorInterno]

	SET NOCOUNT OFF
END

GO
