IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSolicitudEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSolicitudEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateSolicitudEnsayo]
(
	@IDSolicitudEnsayo int,
	@IDSE int,
	@IDPER int,
	@SOE_FechaHora char(18),
	@SOE_EsCOTSC char(18),
	@IDJefeLaboratorio int,
	@SOE_FecEntIEMB char(18),
	@SOE_FechaReceMues char(18),
	@SOE_HoraReceMues char(18),
	@SOE_ConReceMues char(18),
	@SOE_TemReceMues char(18),
	@SOE_FecEntIEFQ char(18),
	@SOE_FecEntIEFO char(18),
	@SOE_FecEntIEH char(18),
	@SOE_ViaInfoPreliminar char(18),
	@SOE_InfoAdicional char(18),
	@SOE_Estado char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [SolicitudEnsayo]
	SET [IDPER] = @IDPER, 
		[SOE_FechaHora] = @SOE_FechaHora, 
		[SOE_EsCOTSC] = @SOE_EsCOTSC, 
		[IDJefeLaboratorio] = @IDJefeLaboratorio, 
		[SOE_FecEntIEMB] = @SOE_FecEntIEMB, 
		[SOE_FechaReceMues] = @SOE_FechaReceMues, 
		[SOE_HoraReceMues] = @SOE_HoraReceMues, 
		[SOE_ConReceMues] = @SOE_ConReceMues, 
		[SOE_TemReceMues] = @SOE_TemReceMues, 
		[SOE_FecEntIEFQ] = @SOE_FecEntIEFQ, 
		[SOE_FecEntIEFO] = @SOE_FecEntIEFO, 
		[SOE_FecEntIEH] = @SOE_FecEntIEH, 
		[SOE_ViaInfoPreliminar] = @SOE_ViaInfoPreliminar, 
		[SOE_InfoAdicional] = @SOE_InfoAdicional, 
		[SOE_Estado] = @SOE_Estado
	WHERE [IDSolicitudEnsayo] = @IDSolicitudEnsayo AND [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
