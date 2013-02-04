IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoInforme]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoInforme]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoInforme]
(
	@IDINF int,
	@INF_Numero char(18),
	@INF_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoInforme]
	SET [INF_Numero] = @INF_Numero, 
		[INF_Anio] = @INF_Anio
	WHERE [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
