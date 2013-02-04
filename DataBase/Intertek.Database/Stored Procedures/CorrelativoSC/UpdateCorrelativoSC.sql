IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoSC]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoSC]
(
	@IDSC int,
	@SC_Numero char(18),
	@SC_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoSC]
	SET [SC_Numero] = @SC_Numero, 
		[SC_Anio] = @SC_Anio
	WHERE [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
