IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertGeneracionInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertGeneracionInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertGeneracionInformeEnsayo]
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

	INSERT INTO [GeneracionInformeEnsayo] ([IDPER], [IDINF], [IDInformeEnsayo], [GIE_Fecha], [GIE_TipoGeneracion]) 
	VALUES (@IDPER, @IDINF, @IDInformeEnsayo, @GIE_Fecha, @GIE_TipoGeneracion)

	SET NOCOUNT OFF
END

GO
