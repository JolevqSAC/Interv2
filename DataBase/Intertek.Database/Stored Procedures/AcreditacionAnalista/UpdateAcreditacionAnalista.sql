IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateAcreditacionAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateAcreditacionAnalista]
GO

CREATE PROCEDURE [dbo].[UpdateAcreditacionAnalista]
(
	@IDAcreditacionAnalista int,
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

	UPDATE [AcreditacionAnalista]
	SET [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio, 
		[AAN_Fecha] = @AAN_Fecha, 
		[AAN_Observacion] = @AAN_Observacion, 
		[AAN_Estado] = @AAN_Estado
	WHERE [IDAcreditacionAnalista] = @IDAcreditacionAnalista AND [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
