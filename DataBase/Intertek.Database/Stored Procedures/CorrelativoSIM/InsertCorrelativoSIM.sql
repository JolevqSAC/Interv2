IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoSIM]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoSIM]
(
	@IDSIM int OUT,
	@SIM_Numero char(18),
	@SIM_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoSIM] ([SIM_Numero], [SIM_Anio]) 
	VALUES (@SIM_Numero, @SIM_Anio)

	SET @IDSIM = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
