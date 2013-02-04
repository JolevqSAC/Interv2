IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteGeneracionInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteGeneracionInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[DeleteGeneracionInformeEnsayo]
(
	@IDPER int,
	@IDINF int,
	@IDInformeEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [GeneracionInformeEnsayo]
	WHERE [IDPER] = @IDPER AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
