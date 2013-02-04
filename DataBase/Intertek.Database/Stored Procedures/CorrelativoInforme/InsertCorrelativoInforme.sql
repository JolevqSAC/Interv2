IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoInforme]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoInforme]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoInforme]
(
	@IDINF int OUT,
	@INF_Numero char(18),
	@INF_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoInforme] ([INF_Numero], [INF_Anio]) 
	VALUES (@INF_Numero, @INF_Anio)

	SET @IDINF = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
