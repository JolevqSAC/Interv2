IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorelativoIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorelativoIM]
GO

CREATE PROCEDURE [dbo].[SelectAllCorelativoIM]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDIM],
	[IM_Numero],
	[IM_Anio]
	FROM [CorelativoIM]

	SET NOCOUNT OFF
END

GO
