IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectIMPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectIMPrecintos]
GO

CREATE PROCEDURE [dbo].[SelectIMPrecintos]
(
	@IDPER int,
	@IDIM int,
	@IDInforme int,
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[IDIM],
	[IDInforme],
	[IDPrecintos],
	[IMP_Fecha],
	[IMP_Tipo]
	FROM [IMPrecintos]
	WHERE [IDPER] = @IDPER AND [IDIM] = @IDIM AND [IDInforme] = @IDInforme AND [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
