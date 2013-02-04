IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoSI]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoSI]
(
	@IDSI int OUT,
	@SI_Numero char(18),
	@SI_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoSI] ([SI_Numero], [SI_Anio]) 
	VALUES (@SI_Numero, @SI_Anio)

	SET @IDSI = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
