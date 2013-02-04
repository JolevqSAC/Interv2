IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteReportesByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteReportesByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteReportesByIDLaboratorio]
(
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Reportes]
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
