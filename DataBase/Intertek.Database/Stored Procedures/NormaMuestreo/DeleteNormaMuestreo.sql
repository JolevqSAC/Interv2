IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteNormaMuestreo]
(
	@IDNormaMuestreo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaMuestreo]
	WHERE [IDNormaMuestreo] = @IDNormaMuestreo

	SET NOCOUNT OFF
END

GO
