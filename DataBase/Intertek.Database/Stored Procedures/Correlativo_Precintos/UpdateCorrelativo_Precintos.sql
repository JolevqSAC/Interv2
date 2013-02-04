IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativo_Precintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativo_Precintos]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativo_Precintos]
(
	@IDPrecintos int,
	@PRE_Numero char(18),
	@PRE_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Correlativo_Precintos]
	SET [PRE_Numero] = @PRE_Numero, 
		[PRE_Anio] = @PRE_Anio
	WHERE [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
