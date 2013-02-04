IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativosLAB]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativosLAB]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativosLAB]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDLab],
	[LAB_Numero],
	[LAB_Anio]
	FROM [CorrelativosLAB]

	SET NOCOUNT OFF
END

GO
