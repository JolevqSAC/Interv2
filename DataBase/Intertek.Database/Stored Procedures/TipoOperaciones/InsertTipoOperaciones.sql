IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertTipoOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertTipoOperaciones]
GO

CREATE PROCEDURE [dbo].[InsertTipoOperaciones]
(
	@IDTiposOperaciones int OUT,
	@TIO_Nombre char(18),
	@TIO_Activa char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [TipoOperaciones] ([TIO_Nombre], [TIO_Activa]) 
	VALUES (@TIO_Nombre, @TIO_Activa)

	SET @IDTiposOperaciones = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
