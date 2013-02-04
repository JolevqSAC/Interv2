IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAcreditacionAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAcreditacionAnalista]
GO

CREATE PROCEDURE [dbo].[SelectAcreditacionAnalista]
(
	@IDAcreditacionAnalista int,
	@IDEnsayo int,
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
	WHERE [IDAcreditacionAnalista] = @IDAcreditacionAnalista AND [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
