IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSolicitudEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSolicitudEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllSolicitudEnsayo]

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

	SET NOCOUNT OFF
END

GO
