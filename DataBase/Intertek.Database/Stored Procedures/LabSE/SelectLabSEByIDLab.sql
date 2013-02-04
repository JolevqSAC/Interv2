IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLabSEByIDLab]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectLabSEByIDLab]
GO

CREATE PROCEDURE [dbo].[SelectLabSEByIDLab]
(
	@IDLab int
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
	WHERE [IDLab] = @IDLab

	SET NOCOUNT OFF
END

GO
