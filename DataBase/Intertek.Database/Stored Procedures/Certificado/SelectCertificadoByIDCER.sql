IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificadoByIDCER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCertificadoByIDCER]
GO

CREATE PROCEDURE [dbo].[SelectCertificadoByIDCER]
(
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
	WHERE [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
