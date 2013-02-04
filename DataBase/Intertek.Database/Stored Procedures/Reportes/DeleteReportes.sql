IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteReportes]
GO

CREATE PROCEDURE [dbo].[DeleteReportes]
(
	@IDReportes int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Reportes]
	WHERE [IDReportes] = @IDReportes

	SET NOCOUNT OFF
END

GO
