IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteIMPrecintosByIDInformeAndIDPERAndIDIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteIMPrecintosByIDInformeAndIDPERAndIDIM]
GO

CREATE PROCEDURE [dbo].[DeleteIMPrecintosByIDInformeAndIDPERAndIDIM]
(
	@IDInforme int,
	@IDPER int,
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [IMPrecintos]
	WHERE [IDInforme] = @IDInforme AND [IDPER] = @IDPER AND [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
