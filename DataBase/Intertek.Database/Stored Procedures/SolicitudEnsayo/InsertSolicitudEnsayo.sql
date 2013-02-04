IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSolicitudEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSolicitudEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertSolicitudEnsayo]
(
	@IDSolicitudEnsayo int OUT,
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

	INSERT INTO [SolicitudEnsayo] ([IDSE], [IDPER], [SOE_FechaHora], [SOE_EsCOTSC], [IDJefeLaboratorio], [SOE_FecEntIEMB], [SOE_FechaReceMues], [SOE_HoraReceMues], [SOE_ConReceMues], [SOE_TemReceMues], [SOE_FecEntIEFQ], [SOE_FecEntIEFO], [SOE_FecEntIEH], [SOE_ViaInfoPreliminar], [SOE_InfoAdicional], [SOE_Estado]) 
	VALUES (@IDSE, @IDPER, @SOE_FechaHora, @SOE_EsCOTSC, @IDJefeLaboratorio, @SOE_FecEntIEMB, @SOE_FechaReceMues, @SOE_HoraReceMues, @SOE_ConReceMues, @SOE_TemReceMues, @SOE_FecEntIEFQ, @SOE_FecEntIEFO, @SOE_FecEntIEH, @SOE_ViaInfoPreliminar, @SOE_InfoAdicional, @SOE_Estado)

	SET @IDSolicitudEnsayo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
