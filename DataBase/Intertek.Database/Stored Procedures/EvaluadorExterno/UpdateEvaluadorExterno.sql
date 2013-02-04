IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEvaluadorExterno]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEvaluadorExterno]
GO

CREATE PROCEDURE [dbo].[UpdateEvaluadorExterno]
(
	@IDEvaluadorExterno int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [EvaluadorExterno]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDEvaluadorExterno] = @IDEvaluadorExterno

	SET NOCOUNT OFF
END

GO
