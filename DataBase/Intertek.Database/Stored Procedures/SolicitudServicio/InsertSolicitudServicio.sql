IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSolicitudServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSolicitudServicio]
GO

CREATE PROCEDURE [dbo].[InsertSolicitudServicio]
(
	@IDSolicitudServicio int OUT,
	@IDSS int,
	@IDComentario int,
	@IDPER int,
	@IDProveedor int,
	@SOS_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [SolicitudServicio] ([IDSS], [IDComentario], [IDPER], [IDProveedor], [SOS_Fecha]) 
	VALUES (@IDSS, @IDComentario, @IDPER, @IDProveedor, @SOS_Fecha)

	SET @IDSolicitudServicio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
