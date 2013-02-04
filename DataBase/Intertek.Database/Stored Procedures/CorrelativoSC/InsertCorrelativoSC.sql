IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoSC]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoSC]
(
	@IDSC int OUT,
	@SC_Numero char(18),
	@SC_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoSC] ([SC_Numero], [SC_Anio]) 
	VALUES (@SC_Numero, @SC_Anio)

	SET @IDSC = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
