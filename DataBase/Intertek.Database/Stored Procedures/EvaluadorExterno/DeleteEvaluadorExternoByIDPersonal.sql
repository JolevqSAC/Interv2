IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEvaluadorExternoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEvaluadorExternoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteEvaluadorExternoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EvaluadorExterno]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
