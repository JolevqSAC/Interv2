IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[SelectAllEvaluadorExterno]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorExterno],
	[IDPersonal]
	FROM [EvaluadorExterno]

	SET NOCOUNT OFF
END

GO
