IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnaquelMD]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAnaquelMD]
GO

CREATE PROCEDURE [dbo].[SelectAnaquelMD]
(
	@IDAnaquelMD int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAnaquelMD],
	[IDMuestrasDirimentes],
	[IDAnaquel],
	[AMD_FechaRecepcion],
	[AMD_CapacidadUtilizada]
	FROM [AnaquelMD]
	WHERE [IDAnaquelMD] = @IDAnaquelMD

	SET NOCOUNT OFF
END

GO
