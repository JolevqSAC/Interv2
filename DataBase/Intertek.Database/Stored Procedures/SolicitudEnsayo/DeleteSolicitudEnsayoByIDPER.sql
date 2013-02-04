IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudEnsayoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudEnsayoByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudEnsayoByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudEnsayo]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
