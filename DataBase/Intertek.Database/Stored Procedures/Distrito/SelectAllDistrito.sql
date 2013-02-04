IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllDistrito]
GO

CREATE PROCEDURE [dbo].[SelectAllDistrito]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDistrito],
	[DIS_Nombre],
	[IDProvincia]
	FROM [Distrito]

	SET NOCOUNT OFF
END

GO
