IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateTipoOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateTipoOperaciones]
GO

CREATE PROCEDURE [dbo].[UpdateTipoOperaciones]
(
	@IDTiposOperaciones int,
	@TIO_Nombre char(18),
	@TIO_Activa char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [TipoOperaciones]
	SET [TIO_Nombre] = @TIO_Nombre, 
		[TIO_Activa] = @TIO_Activa
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
