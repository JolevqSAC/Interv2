IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativosLAB]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativosLAB]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativosLAB]
(
	@IDLab int OUT,
	@LAB_Numero char(18),
	@LAB_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativosLAB] ([LAB_Numero], [LAB_Anio]) 
	VALUES (@LAB_Numero, @LAB_Anio)

	SET @IDLab = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
