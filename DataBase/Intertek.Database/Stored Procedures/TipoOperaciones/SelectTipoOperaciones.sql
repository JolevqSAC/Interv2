IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTipoOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectTipoOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectTipoOperaciones]
(
	@IDTiposOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDTiposOperaciones],
	[TIO_Nombre],
	[TIO_Activa]
	FROM [TipoOperaciones]
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
