IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativosLAB]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativosLAB]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativosLAB]
(
	@IDLab int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDLab],
	[LAB_Numero],
	[LAB_Anio]
	FROM [CorrelativosLAB]
	WHERE [IDLab] = @IDLab

	SET NOCOUNT OFF
END

GO
