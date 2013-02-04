IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorelativoIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorelativoIM]
GO

CREATE PROCEDURE [dbo].[UpdateCorelativoIM]
(
	@IDIM int,
	@IM_Numero char(18),
	@IM_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorelativoIM]
	SET [IM_Numero] = @IM_Numero, 
		[IM_Anio] = @IM_Anio
	WHERE [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
