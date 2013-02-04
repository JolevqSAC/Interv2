IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAcreditacionAnalistaByIDAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAcreditacionAnalistaByIDAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteAcreditacionAnalistaByIDAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AcreditacionAnalista]
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
