IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoCertificado]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoCertificado]
(
	@IDCER int OUT,
	@CCE_Numero char(18),
	@CCE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoCertificado] ([CCE_Numero], [CCE_Anio]) 
	VALUES (@CCE_Numero, @CCE_Anio)

	SET @IDCER = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
