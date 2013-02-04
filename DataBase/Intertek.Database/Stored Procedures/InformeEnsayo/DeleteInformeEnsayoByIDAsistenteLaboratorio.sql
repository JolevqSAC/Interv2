IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoByIDAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoByIDAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoByIDAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayo]
	WHERE [IDAsistenteLaboratorio] = @IDAsistenteLaboratorio

	SET NOCOUNT OFF
END

GO
