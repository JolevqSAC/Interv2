IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllAcreditacionAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllAcreditacionAnalista]
GO

CREATE PROCEDURE [dbo].[SelectAllAcreditacionAnalista]

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

	SET NOCOUNT OFF
END

GO
