IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoAnalistaByIDLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDLabSE]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDLabSE]
(
	@IDLabSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayoAnalista]
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
