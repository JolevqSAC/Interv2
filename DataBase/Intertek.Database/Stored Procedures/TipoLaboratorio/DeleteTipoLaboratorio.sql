IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteTipoLaboratorio]
(
	@IDTipoLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [TipoLaboratorio]
	WHERE [IDTipoLaboratorio] = @IDTipoLaboratorio

	SET NOCOUNT OFF
END

GO
