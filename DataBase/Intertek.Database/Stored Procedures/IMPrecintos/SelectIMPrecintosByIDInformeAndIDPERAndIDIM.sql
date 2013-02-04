IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectIMPrecintosByIDInformeAndIDPERAndIDIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectIMPrecintosByIDInformeAndIDPERAndIDIM]
GO

CREATE PROCEDURE [dbo].[SelectIMPrecintosByIDInformeAndIDPERAndIDIM]
(
	@IDInforme int,
	@IDPER int,
	@IDIM int
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
	WHERE [IDInforme] = @IDInforme AND [IDPER] = @IDPER AND [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
