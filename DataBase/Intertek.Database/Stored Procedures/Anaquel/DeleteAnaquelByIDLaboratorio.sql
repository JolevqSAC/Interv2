IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnaquelByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnaquelByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteAnaquelByIDLaboratorio]
(
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Anaquel]
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
