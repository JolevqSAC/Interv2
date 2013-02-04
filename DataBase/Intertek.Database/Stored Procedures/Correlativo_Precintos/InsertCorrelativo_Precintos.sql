IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativo_Precintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativo_Precintos]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativo_Precintos]
(
	@IDPrecintos int OUT,
	@PRE_Numero char(18),
	@PRE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Correlativo_Precintos] ([PRE_Numero], [PRE_Anio]) 
	VALUES (@PRE_Numero, @PRE_Anio)

	SET @IDPrecintos = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
