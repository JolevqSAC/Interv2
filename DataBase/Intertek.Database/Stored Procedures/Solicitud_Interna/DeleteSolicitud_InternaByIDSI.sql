IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_InternaByIDSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_InternaByIDSI]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_InternaByIDSI]
(
	@IDSI int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_Interna]
	WHERE [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
