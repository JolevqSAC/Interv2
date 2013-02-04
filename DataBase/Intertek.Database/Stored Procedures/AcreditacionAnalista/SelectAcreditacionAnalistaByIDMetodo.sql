IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAcreditacionAnalistaByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAcreditacionAnalistaByIDMetodo]
GO

CREATE PROCEDURE [dbo].[SelectAcreditacionAnalistaByIDMetodo]
(
	@IDMetodo int
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
