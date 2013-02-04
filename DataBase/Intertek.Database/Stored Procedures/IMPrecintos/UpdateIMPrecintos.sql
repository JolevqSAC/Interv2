IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateIMPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateIMPrecintos]
GO

CREATE PROCEDURE [dbo].[UpdateIMPrecintos]
(
	@IDPER int,
	@IDIM int,
	@IDInforme int,
	@IDPrecintos int,
	@IMP_Fecha char(18),
	@IMP_Tipo char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [IMPrecintos]
	SET [IMP_Fecha] = @IMP_Fecha, 
		[IMP_Tipo] = @IMP_Tipo
	WHERE [IDPER] = @IDPER AND [IDIM] = @IDIM AND [IDInforme] = @IDInforme AND [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
