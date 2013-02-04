IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativosLAB]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativosLAB]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativosLAB]
(
	@IDLab int,
	@LAB_Numero char(18),
	@LAB_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativosLAB]
	SET [LAB_Numero] = @LAB_Numero, 
		[LAB_Anio] = @LAB_Anio
	WHERE [IDLab] = @IDLab

	SET NOCOUNT OFF
END

GO
