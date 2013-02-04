IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoByIDJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoByIDJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoByIDJefeLaboratorio]
(
	@IDJefeLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayo]
	WHERE [IDJefeLaboratorio] = @IDJefeLaboratorio

	SET NOCOUNT OFF
END

GO
