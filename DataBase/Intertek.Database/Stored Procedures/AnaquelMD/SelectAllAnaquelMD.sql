IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllAnaquelMD]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllAnaquelMD]
GO

CREATE PROCEDURE [dbo].[SelectAllAnaquelMD]

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

	SET NOCOUNT OFF
END

GO
