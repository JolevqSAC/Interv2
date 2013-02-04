IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudEnsayoByIDSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudEnsayoByIDSE]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudEnsayoByIDSE]
(
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudEnsayo]
	WHERE [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
