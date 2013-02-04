IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoSC]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoSC]
(
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoSC]
	WHERE [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
