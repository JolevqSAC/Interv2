IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLabSEByIDSolicitudEnsayoAndIDSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLabSEByIDSolicitudEnsayoAndIDSE]
GO

CREATE PROCEDURE [dbo].[DeleteLabSEByIDSolicitudEnsayoAndIDSE]
(
	@IDSolicitudEnsayo int,
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [LabSE]
	WHERE [IDSolicitudEnsayo] = @IDSolicitudEnsayo AND [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
