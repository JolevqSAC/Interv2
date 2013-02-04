IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudEnsayo]
(
	@IDSolicitudEnsayo int,
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudEnsayo]
	WHERE [IDSolicitudEnsayo] = @IDSolicitudEnsayo AND [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
