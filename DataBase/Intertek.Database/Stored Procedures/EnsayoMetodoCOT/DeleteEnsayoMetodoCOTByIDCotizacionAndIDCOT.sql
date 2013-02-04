IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoCOTByIDCotizacionAndIDCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDCotizacionAndIDCOT]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDCotizacionAndIDCOT]
(
	@IDCotizacion int,
	@IDCOT int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoCOT]
	WHERE [IDCotizacion] = @IDCotizacion AND [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
