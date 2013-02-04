IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoByIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoByIDINF]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoByIDINF]
(
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayo]
	WHERE [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
