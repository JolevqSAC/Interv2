IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteIMPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteIMPrecintos]
GO

CREATE PROCEDURE [dbo].[DeleteIMPrecintos]
(
	@IDPER int,
	@IDIM int,
	@IDInforme int,
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [IMPrecintos]
	WHERE [IDPER] = @IDPER AND [IDIM] = @IDIM AND [IDInforme] = @IDInforme AND [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
