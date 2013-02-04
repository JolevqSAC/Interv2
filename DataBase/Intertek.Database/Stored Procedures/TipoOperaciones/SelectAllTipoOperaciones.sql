IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllTipoOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllTipoOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectAllTipoOperaciones]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDTiposOperaciones],
	[TIO_Nombre],
	[TIO_Activa]
	FROM [TipoOperaciones]

	SET NOCOUNT OFF
END

GO
