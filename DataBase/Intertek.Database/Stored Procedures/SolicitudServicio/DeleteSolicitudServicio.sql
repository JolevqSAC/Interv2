IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudServicio]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudServicio]
(
	@IDSolicitudServicio int,
	@IDSS int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudServicio]
	WHERE [IDSolicitudServicio] = @IDSolicitudServicio AND [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
