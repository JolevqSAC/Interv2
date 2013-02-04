IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAcreditacionAnalistaByIDAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAcreditacionAnalistaByIDAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAcreditacionAnalistaByIDAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAcreditacionAnalista],
	[IDEnsayo],
	[IDMetodo],
	[IDAnalistaLaboratorio],
	[AAN_Fecha],
	[AAN_Observacion],
	[AAN_Estado]
	FROM [AcreditacionAnalista]
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
