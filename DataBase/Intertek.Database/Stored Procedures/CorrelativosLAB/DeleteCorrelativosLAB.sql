IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativosLAB]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativosLAB]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativosLAB]
(
	@IDLab int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativosLAB]
	WHERE [IDLab] = @IDLab

	SET NOCOUNT OFF
END

GO
