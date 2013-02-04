IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoCertificado]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoCertificado]
(
	@IDCER int,
	@CCE_Numero char(18),
	@CCE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoCertificado]
	SET [CCE_Numero] = @CCE_Numero, 
		[CCE_Anio] = @CCE_Anio
	WHERE [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
