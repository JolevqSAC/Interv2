IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSolicitudServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSolicitudServicio]
GO

CREATE PROCEDURE [dbo].[UpdateSolicitudServicio]
(
	@IDSolicitudServicio int,
	@IDSS int,
	@IDComentario int,
	@IDPER int,
	@IDProveedor int,
	@SOS_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [SolicitudServicio]
	SET [IDComentario] = @IDComentario, 
		[IDPER] = @IDPER, 
		[IDProveedor] = @IDProveedor, 
		[SOS_Fecha] = @SOS_Fecha
	WHERE [IDSolicitudServicio] = @IDSolicitudServicio AND [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
