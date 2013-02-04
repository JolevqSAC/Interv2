IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnaquelMDByIDAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAnaquelMDByIDAnaquel]
GO

CREATE PROCEDURE [dbo].[SelectAnaquelMDByIDAnaquel]
(
	@IDAnaquel int
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
	WHERE [IDAnaquel] = @IDAnaquel

	SET NOCOUNT OFF
END

GO
