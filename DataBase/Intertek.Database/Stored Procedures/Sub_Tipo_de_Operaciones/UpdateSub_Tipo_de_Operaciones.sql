IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSub_Tipo_de_Operaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSub_Tipo_de_Operaciones]
GO

CREATE PROCEDURE [dbo].[UpdateSub_Tipo_de_Operaciones]
(
	@IDSubTipoOperaciones int,
	@IDTiposOperaciones int,
	@STO_Nombre char(18),
	@STO_Activa char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Sub_Tipo_de_Operaciones]
	SET [IDTiposOperaciones] = @IDTiposOperaciones, 
		[STO_Nombre] = @STO_Nombre, 
		[STO_Activa] = @STO_Activa
	WHERE [IDSubTipoOperaciones] = @IDSubTipoOperaciones

	SET NOCOUNT OFF
END

GO
