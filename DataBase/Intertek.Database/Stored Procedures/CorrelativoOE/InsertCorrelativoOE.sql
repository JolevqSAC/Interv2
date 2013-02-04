IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoOE]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoOE]
(
	@IDOE int OUT,
	@OE_Numero char(18),
	@OE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoOE] ([OE_Numero], [OE_Anio]) 
	VALUES (@OE_Numero, @OE_Anio)

	SET @IDOE = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
