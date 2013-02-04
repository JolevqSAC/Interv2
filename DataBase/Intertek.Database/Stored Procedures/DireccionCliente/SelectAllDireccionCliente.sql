IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllDireccionCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllDireccionCliente]
GO

CREATE PROCEDURE [dbo].[SelectAllDireccionCliente]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDireccionCliente],
	[DIC_Codigo],
	[DIC_Tipo],
	[DIC_Descripcion],
	[IDCliente],
	[DIC_Estado],
	[DIC_UsuarioCreacion],
	[DIC_FechaHoraCreacion],
	[DIC_UsuarioModificacion],
	[DIC_FechaHoraModificacion]
	FROM [DireccionCliente]

	SET NOCOUNT OFF
END

GO
