IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoSIM]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoSIM]
(
	@IDSIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoSIM]
	WHERE [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
