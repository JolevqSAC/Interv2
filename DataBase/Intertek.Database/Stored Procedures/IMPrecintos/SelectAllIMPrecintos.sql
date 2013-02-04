IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllIMPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllIMPrecintos]
GO

CREATE PROCEDURE [dbo].[SelectAllIMPrecintos]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[IDIM],
	[IDInforme],
	[IDPrecintos],
	[IMP_Fecha],
	[IMP_Tipo]
	FROM [IMPrecintos]

	SET NOCOUNT OFF
END

GO
