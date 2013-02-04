IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoAnalistaByIDAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoAnalistaByIDAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayoAnalista]
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
