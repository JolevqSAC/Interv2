IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCentroCosto]
GO

CREATE PROCEDURE [dbo].[SelectCentroCosto]
(
	@IDCentroCosto int
)
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
	WHERE [IDCentroCosto] = @IDCentroCosto

	SET NOCOUNT OFF
END

GO
