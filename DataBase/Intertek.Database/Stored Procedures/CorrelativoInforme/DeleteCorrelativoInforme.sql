IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoInforme]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoInforme]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoInforme]
(
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoInforme]
	WHERE [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
