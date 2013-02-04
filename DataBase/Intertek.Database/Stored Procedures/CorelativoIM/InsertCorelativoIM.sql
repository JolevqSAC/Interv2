IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorelativoIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorelativoIM]
GO

CREATE PROCEDURE [dbo].[InsertCorelativoIM]
(
	@IDIM int OUT,
	@IM_Numero char(18),
	@IM_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorelativoIM] ([IM_Numero], [IM_Anio]) 
	VALUES (@IM_Numero, @IM_Anio)

	SET @IDIM = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
