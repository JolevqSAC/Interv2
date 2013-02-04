IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCertificado]
GO

CREATE PROCEDURE [dbo].[SelectCertificado]
(
	@IDCertificado int,
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCertificado],
	[IDCER],
	[IDComentario],
	[CER_Fecha]
	FROM [Certificado]
	WHERE [IDCertificado] = @IDCertificado AND [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
