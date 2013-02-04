IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativo_PER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativo_PER]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativo_PER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Correlativo_PER]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
