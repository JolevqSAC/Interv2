IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoSE]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoSE]
(
	@IDSE int OUT,
	@CSE_Numero char(18),
	@CSE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoSE] ([CSE_Numero], [CSE_Anio]) 
	VALUES (@CSE_Numero, @CSE_Anio)

	SET @IDSE = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
