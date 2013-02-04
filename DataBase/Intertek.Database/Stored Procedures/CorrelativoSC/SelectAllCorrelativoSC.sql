IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoSC]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoSC]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSC],
	[SC_Numero],
	[SC_Anio]
	FROM [CorrelativoSC]

	SET NOCOUNT OFF
END

GO
