IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEvaluadorInternoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEvaluadorInternoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectEvaluadorInternoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorInterno],
	[IDPersonal]
	FROM [EvaluadorInterno]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
