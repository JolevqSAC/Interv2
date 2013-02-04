IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCentroCosto]
GO

CREATE PROCEDURE [dbo].[SelectAllCentroCosto]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCentroCosto],
	[CCO_Codigo],
	[CCO_Nombre],
	[CCO_Descripcion],
	[CCO_Estado],
	[CCO_UsuarioCreacion],
	[CCO_FechaHoraCreacion],
	[CCO_UsuarioModificacion],
	[CCO_FechaHoraModificacion]
	FROM [CentroCosto]

	SET NOCOUNT OFF
END

GO
