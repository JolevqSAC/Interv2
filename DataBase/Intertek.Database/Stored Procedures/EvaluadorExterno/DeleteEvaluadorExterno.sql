IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[DeleteEvaluadorExterno]
(
	@IDEvaluadorExterno int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EvaluadorExterno]
	WHERE [IDEvaluadorExterno] = @IDEvaluadorExterno

	SET NOCOUNT OFF
END

GO
