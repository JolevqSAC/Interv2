IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllOpcionSistema]
GO

CREATE PROCEDURE [dbo].[SelectAllOpcionSistema]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDOpcionSistema],
	[OSI_Nombre],
	[OSI_Modulo],
	[OSI_Estado],
	[OSI_Nombre_en-US],
	[OSI_Modulo_en-US],
	[OSI_RutaPagina],
	[OSI_UsuarioCreacion],
	[OSI_FechaHoraCreacion],
	[OSI_UsuarioModificacion],
	[OSI_FechaHoraModificacion],
	[OSI_Codigo]
	FROM [OpcionSistema]

	SET NOCOUNT OFF
END

GO
