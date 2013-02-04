IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSub_Tipo_de_Operaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSub_Tipo_de_Operaciones]
GO

CREATE PROCEDURE [dbo].[DeleteSub_Tipo_de_Operaciones]
(
	@IDSubTipoOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Sub_Tipo_de_Operaciones]
	WHERE [IDSubTipoOperaciones] = @IDSubTipoOperaciones

	SET NOCOUNT OFF
END

GO
