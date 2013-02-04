IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoFAC]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoFAC]
(
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDFAC],
	[FAC_Numero],
	[FAC_Serie],
	[FAC_Anio]
	FROM [CorrelativoFAC]
	WHERE [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
