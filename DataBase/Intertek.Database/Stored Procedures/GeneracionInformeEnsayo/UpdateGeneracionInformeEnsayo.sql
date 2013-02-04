IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateGeneracionInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateGeneracionInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateGeneracionInformeEnsayo]
(
	@IDPER int,
	@IDINF int,
	@IDInformeEnsayo int,
	@GIE_Fecha char(18),
	@GIE_TipoGeneracion char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [GeneracionInformeEnsayo]
	SET [GIE_Fecha] = @GIE_Fecha, 
		[GIE_TipoGeneracion] = @GIE_TipoGeneracion
	WHERE [IDPER] = @IDPER AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
