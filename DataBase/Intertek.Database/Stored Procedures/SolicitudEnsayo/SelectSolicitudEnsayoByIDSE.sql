IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudEnsayoByIDSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudEnsayoByIDSE]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudEnsayoByIDSE]
(
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudEnsayo],
	[IDSE],
	[IDPER],
	[SOE_FechaHora],
	[SOE_EsCOTSC],
	[IDJefeLaboratorio],
	[SOE_FecEntIEMB],
	[SOE_FechaReceMues],
	[SOE_HoraReceMues],
	[SOE_ConReceMues],
	[SOE_TemReceMues],
	[SOE_FecEntIEFQ],
	[SOE_FecEntIEFO],
	[SOE_FecEntIEH],
	[SOE_ViaInfoPreliminar],
	[SOE_InfoAdicional],
	[SOE_Estado]
	FROM [SolicitudEnsayo]
	WHERE [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
