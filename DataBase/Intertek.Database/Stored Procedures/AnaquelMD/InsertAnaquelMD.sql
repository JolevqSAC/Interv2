IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertAnaquelMD]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertAnaquelMD]
GO

CREATE PROCEDURE [dbo].[InsertAnaquelMD]
(
	@IDAnaquelMD int OUT,
	@IDMuestrasDirimentes int,
	@IDAnaquel int,
	@AMD_FechaRecepcion char(18),
	@AMD_CapacidadUtilizada char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [AnaquelMD] ([IDMuestrasDirimentes], [IDAnaquel], [AMD_FechaRecepcion], [AMD_CapacidadUtilizada]) 
	VALUES (@IDMuestrasDirimentes, @IDAnaquel, @AMD_FechaRecepcion, @AMD_CapacidadUtilizada)

	SET @IDAnaquelMD = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
