IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateProveedor]
GO

CREATE PROCEDURE [dbo].[UpdateProveedor]
(
	@IDProveedor int,
	@IDDistrito int,
	@PRV_Codigo varchar(10),
	@PRV_RazonSocial varchar(200),
	@PRV_Direccion varchar(150),
	@PRV_Telefono1 varchar(20),
	@PRV_Contacto varchar(150),
	@PRV_Correo varchar(50),
	@PRV_Fax varchar(20),
	@PRV_Observaciones varchar(200),
	@PRV_RUC varchar(11),
	@PRV_Telefono2 varchar(20),
	@PRV_Estado varchar(1),
	@PRV_IndicadorArea char(1),
	@PRV_UsuarioCreacion varchar(25),
	@PRV_FechaHoraCreacion datetime,
	@PRV_UsuarioModificacion varchar(25),
	@PRV_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Proveedor]
	SET [IDDistrito] = @IDDistrito, 
		[PRV_Codigo] = @PRV_Codigo, 
		[PRV_RazonSocial] = @PRV_RazonSocial, 
		[PRV_Direccion] = @PRV_Direccion, 
		[PRV_Telefono1] = @PRV_Telefono1, 
		[PRV_Contacto] = @PRV_Contacto, 
		[PRV_Correo] = @PRV_Correo, 
		[PRV_Fax] = @PRV_Fax, 
		[PRV_Observaciones] = @PRV_Observaciones, 
		[PRV_RUC] = @PRV_RUC, 
		[PRV_Telefono2] = @PRV_Telefono2, 
		[PRV_Estado] = @PRV_Estado, 
		[PRV_IndicadorArea] = @PRV_IndicadorArea, 
		[PRV_UsuarioCreacion] = @PRV_UsuarioCreacion, 
		[PRV_FechaHoraCreacion] = @PRV_FechaHoraCreacion, 
		[PRV_UsuarioModificacion] = @PRV_UsuarioModificacion, 
		[PRV_FechaHoraModificacion] = @PRV_FechaHoraModificacion
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
