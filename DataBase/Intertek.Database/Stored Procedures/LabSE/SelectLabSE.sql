IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectLabSE]
GO

CREATE PROCEDURE [dbo].[SelectLabSE]
(
	@IDLabSE int
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
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
