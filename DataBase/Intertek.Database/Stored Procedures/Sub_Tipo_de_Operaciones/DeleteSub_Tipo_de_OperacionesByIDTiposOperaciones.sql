IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSub_Tipo_de_OperacionesByIDTiposOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSub_Tipo_de_OperacionesByIDTiposOperaciones]
GO

CREATE PROCEDURE [dbo].[DeleteSub_Tipo_de_OperacionesByIDTiposOperaciones]
(
	@IDTiposOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Sub_Tipo_de_Operaciones]
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
