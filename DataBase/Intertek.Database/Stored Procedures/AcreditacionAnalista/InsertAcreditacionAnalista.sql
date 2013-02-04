IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertAcreditacionAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertAcreditacionAnalista]
GO

CREATE PROCEDURE [dbo].[InsertAcreditacionAnalista]
(
	@IDAcreditacionAnalista int OUT,
	@IDEnsayo int,
	@IDMetodo int,
	@IDAnalistaLaboratorio int,
	@AAN_Fecha char(18),
	@AAN_Observacion char(18),
	@AAN_Estado char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [AcreditacionAnalista] ([IDEnsayo], [IDMetodo], [IDAnalistaLaboratorio], [AAN_Fecha], [AAN_Observacion], [AAN_Estado]) 
	VALUES (@IDEnsayo, @IDMetodo, @IDAnalistaLaboratorio, @AAN_Fecha, @AAN_Observacion, @AAN_Estado)

	SET @IDAcreditacionAnalista = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
