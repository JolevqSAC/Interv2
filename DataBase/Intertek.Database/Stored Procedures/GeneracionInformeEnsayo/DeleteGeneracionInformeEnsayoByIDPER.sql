IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteGeneracionInformeEnsayoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteGeneracionInformeEnsayoByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteGeneracionInformeEnsayoByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [GeneracionInformeEnsayo]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
