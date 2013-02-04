IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAcreditacionAnalistaByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAcreditacionAnalistaByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAcreditacionAnalistaByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
