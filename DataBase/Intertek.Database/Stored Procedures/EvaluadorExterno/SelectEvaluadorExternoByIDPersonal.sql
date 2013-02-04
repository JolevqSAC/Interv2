IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEvaluadorExternoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEvaluadorExternoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectEvaluadorExternoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEvaluadorExterno],
	[IDPersonal]
	FROM [EvaluadorExterno]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
