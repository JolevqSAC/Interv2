IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEvaluadorInternoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEvaluadorInternoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteEvaluadorInternoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EvaluadorInterno]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
