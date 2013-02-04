IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDProducto]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDProducto]
(
	@IDProducto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
