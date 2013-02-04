IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnaquelMDByIDMuestrasDirimentes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAnaquelMDByIDMuestrasDirimentes]
GO

CREATE PROCEDURE [dbo].[SelectAnaquelMDByIDMuestrasDirimentes]
(
	@IDMuestrasDirimentes int
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
	WHERE [IDMuestrasDirimentes] = @IDMuestrasDirimentes

	SET NOCOUNT OFF
END

GO
