IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCertificadoByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCertificadoByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectCertificadoByIDComentario]
(
	@IDComentario int
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
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
