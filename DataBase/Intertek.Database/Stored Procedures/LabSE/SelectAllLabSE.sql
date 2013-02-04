IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllLabSE]
GO

CREATE PROCEDURE [dbo].[SelectAllLabSE]

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

	SET NOCOUNT OFF
END

GO
