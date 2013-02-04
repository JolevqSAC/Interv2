IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateAnaquelMD]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateAnaquelMD]
GO

CREATE PROCEDURE [dbo].[UpdateAnaquelMD]
(
	@IDAnaquelMD int,
	@IDMuestrasDirimentes int,
	@IDAnaquel int,
	@AMD_FechaRecepcion char(18),
	@AMD_CapacidadUtilizada char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [AnaquelMD]
	SET [IDMuestrasDirimentes] = @IDMuestrasDirimentes, 
		[IDAnaquel] = @IDAnaquel, 
		[AMD_FechaRecepcion] = @AMD_FechaRecepcion, 
		[AMD_CapacidadUtilizada] = @AMD_CapacidadUtilizada
	WHERE [IDAnaquelMD] = @IDAnaquelMD

	SET NOCOUNT OFF
END

GO
