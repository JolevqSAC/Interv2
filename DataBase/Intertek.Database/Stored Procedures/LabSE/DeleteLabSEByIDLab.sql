IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLabSEByIDLab]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLabSEByIDLab]
GO

CREATE PROCEDURE [dbo].[DeleteLabSEByIDLab]
(
	@IDLab int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [LabSE]
	WHERE [IDLab] = @IDLab

	SET NOCOUNT OFF
END

GO
