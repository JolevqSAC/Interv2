IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoSIM]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoSIM]
(
	@IDSIM int,
	@SIM_Numero char(18),
	@SIM_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoSIM]
	SET [SIM_Numero] = @SIM_Numero, 
		[SIM_Anio] = @SIM_Anio
	WHERE [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
