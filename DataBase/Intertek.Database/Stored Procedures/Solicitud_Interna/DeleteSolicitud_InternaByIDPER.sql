IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_InternaByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_InternaByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_InternaByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_Interna]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
