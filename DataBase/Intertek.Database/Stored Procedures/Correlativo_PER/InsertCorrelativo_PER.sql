IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativo_PER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativo_PER]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativo_PER]
(
	@IDPER int OUT,
	@PER_Numero char(18),
	@PER_Anio char(18),
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Correlativo_PER] ([PER_Numero], [PER_Anio], [IDLaboratorio]) 
	VALUES (@PER_Numero, @PER_Anio, @IDLaboratorio)

	SET @IDPER = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
