IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoFAC]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoFAC]
(
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoFAC]
	WHERE [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
