IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoSE]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoSE]
(
	@IDSE int,
	@CSE_Numero char(18),
	@CSE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoSE]
	SET [CSE_Numero] = @CSE_Numero, 
		[CSE_Anio] = @CSE_Anio
	WHERE [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
