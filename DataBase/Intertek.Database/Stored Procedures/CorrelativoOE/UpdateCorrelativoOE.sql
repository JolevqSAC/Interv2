IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoOE]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoOE]
(
	@IDOE int,
	@OE_Numero char(18),
	@OE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoOE]
	SET [OE_Numero] = @OE_Numero, 
		[OE_Anio] = @OE_Anio
	WHERE [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
