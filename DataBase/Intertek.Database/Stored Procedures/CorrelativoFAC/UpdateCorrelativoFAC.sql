IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoFAC]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoFAC]
(
	@IDFAC int,
	@FAC_Numero char(18),
	@FAC_Serie char(18),
	@FAC_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoFAC]
	SET [FAC_Numero] = @FAC_Numero, 
		[FAC_Serie] = @FAC_Serie, 
		[FAC_Anio] = @FAC_Anio
	WHERE [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
