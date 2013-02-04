IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudServicioByIDProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudServicioByIDProveedor]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudServicioByIDProveedor]
(
	@IDProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudServicio]
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
