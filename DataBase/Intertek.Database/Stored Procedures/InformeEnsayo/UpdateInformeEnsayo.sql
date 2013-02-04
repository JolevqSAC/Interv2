IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateInformeEnsayo]
(
	@IDInformeEnsayo int,
	@IDINF int,
	@IDComentario int,
	@IDJefeLaboratorio int,
	@INE_Fecha char(18),
	@IDAsistenteLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [InformeEnsayo]
	SET [IDComentario] = @IDComentario, 
		[IDJefeLaboratorio] = @IDJefeLaboratorio, 
		[INE_Fecha] = @INE_Fecha, 
		[IDAsistenteLaboratorio] = @IDAsistenteLaboratorio
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
