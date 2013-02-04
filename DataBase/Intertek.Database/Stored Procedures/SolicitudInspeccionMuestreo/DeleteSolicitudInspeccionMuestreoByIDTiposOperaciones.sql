IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudInspeccionMuestreoByIDTiposOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDTiposOperaciones]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDTiposOperaciones]
(
	@IDTiposOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudInspeccionMuestreo]
	WHERE [IDTiposOperaciones] = @IDTiposOperaciones

	SET NOCOUNT OFF
END

GO
