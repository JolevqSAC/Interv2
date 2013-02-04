IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSub_Tipo_de_Operaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSub_Tipo_de_Operaciones]
GO

CREATE PROCEDURE [dbo].[SelectAllSub_Tipo_de_Operaciones]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSubTipoOperaciones],
	[IDTiposOperaciones],
	[STO_Nombre],
	[STO_Activa]
	FROM [Sub_Tipo_de_Operaciones]

	SET NOCOUNT OFF
END

GO
