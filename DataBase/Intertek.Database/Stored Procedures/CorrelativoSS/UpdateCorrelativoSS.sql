IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoSS]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoSS]
(
	@IDSS int,
	@SS_Numero char(18),
	@SS_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoSS]
	SET [SS_Numero] = @SS_Numero, 
		[SS_Anio] = @SS_Anio
	WHERE [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
