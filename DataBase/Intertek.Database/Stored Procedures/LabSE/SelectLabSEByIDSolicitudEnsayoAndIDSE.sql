IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLabSEByIDSolicitudEnsayoAndIDSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectLabSEByIDSolicitudEnsayoAndIDSE]
GO

CREATE PROCEDURE [dbo].[SelectLabSEByIDSolicitudEnsayoAndIDSE]
(
	@IDSolicitudEnsayo int,
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDLabSE],
	[IDSE],
	[IDLab],
	[IDSolicitudEnsayo],
	[LSE_Fecha]
	FROM [LabSE]
	WHERE [IDSolicitudEnsayo] = @IDSolicitudEnsayo AND [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
