IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoSI]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoSI]
(
	@IDSI int,
	@SI_Numero char(18),
	@SI_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoSI]
	SET [SI_Numero] = @SI_Numero, 
		[SI_Anio] = @SI_Anio
	WHERE [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
