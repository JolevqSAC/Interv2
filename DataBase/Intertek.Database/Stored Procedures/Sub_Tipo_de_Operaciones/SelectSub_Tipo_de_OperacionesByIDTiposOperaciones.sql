IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSub_Tipo_de_OperacionesByIDTiposOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSub_Tipo_de_OperacionesByIDTiposOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectSub_Tipo_de_OperacionesByIDTiposOperaciones]
(
	@IDTiposOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSubTipoOperaciones],
	[IDTiposOperaciones],
	[STO_Nombre],
	[STO_Activa]
	FROM [Sub_Tipo_de_Operaciones]
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
