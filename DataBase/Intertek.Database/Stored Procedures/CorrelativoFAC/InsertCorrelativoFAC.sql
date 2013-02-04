IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoFAC]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoFAC]
(
	@IDFAC int OUT,
	@FAC_Numero char(18),
	@FAC_Serie char(18),
	@FAC_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoFAC] ([FAC_Numero], [FAC_Serie], [FAC_Anio]) 
	VALUES (@FAC_Numero, @FAC_Serie, @FAC_Anio)

	SET @IDFAC = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
