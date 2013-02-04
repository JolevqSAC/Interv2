IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoSS]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoSS]
(
	@IDSS int OUT,
	@SS_Numero char(18),
	@SS_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoSS] ([SS_Numero], [SS_Anio]) 
	VALUES (@SS_Numero, @SS_Anio)

	SET @IDSS = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
