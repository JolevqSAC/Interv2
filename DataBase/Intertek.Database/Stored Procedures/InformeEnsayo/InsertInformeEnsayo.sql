IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertInformeEnsayo]
(
	@IDInformeEnsayo int OUT,
	@IDINF int,
	@IDComentario int,
	@IDJefeLaboratorio int,
	@INE_Fecha char(18),
	@IDAsistenteLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [InformeEnsayo] ([IDINF], [IDComentario], [IDJefeLaboratorio], [INE_Fecha], [IDAsistenteLaboratorio]) 
	VALUES (@IDINF, @IDComentario, @IDJefeLaboratorio, @INE_Fecha, @IDAsistenteLaboratorio)

	SET @IDInformeEnsayo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
