IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativo_Precintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativo_Precintos]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativo_Precintos]
(
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Correlativo_Precintos]
	WHERE [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
