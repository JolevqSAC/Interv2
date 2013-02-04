IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCertificado]
GO

CREATE PROCEDURE [dbo].[SelectAllCertificado]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCertificado],
	[IDCER],
	[IDComentario],
	[CER_Fecha]
	FROM [Certificado]

	SET NOCOUNT OFF
END

GO
