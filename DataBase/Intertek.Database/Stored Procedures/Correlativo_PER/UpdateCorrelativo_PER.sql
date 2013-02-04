IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativo_PER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativo_PER]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativo_PER]
(
	@IDPER int,
	@PER_Numero char(18),
	@PER_Anio char(18),
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Correlativo_PER]
	SET [PER_Numero] = @PER_Numero, 
		[PER_Anio] = @PER_Anio, 
		[IDLaboratorio] = @IDLaboratorio
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
