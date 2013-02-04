IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSub_Tipo_de_Operaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSub_Tipo_de_Operaciones]
GO

CREATE PROCEDURE [dbo].[SelectSub_Tipo_de_Operaciones]
(
	@IDSubTipoOperaciones int
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
	WHERE [IDSubTipoOperaciones] = @IDSubTipoOperaciones

	SET NOCOUNT OFF
END

GO
