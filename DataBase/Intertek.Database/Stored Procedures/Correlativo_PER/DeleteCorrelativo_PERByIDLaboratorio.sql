IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativo_PERByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativo_PERByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativo_PERByIDLaboratorio]
(
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Correlativo_PER]
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
