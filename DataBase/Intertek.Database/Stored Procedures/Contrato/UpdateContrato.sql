IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateContrato]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateContrato]
GO

CREATE PROCEDURE [dbo].[UpdateContrato]
(
	@IDContrato int,
	@CON_Codigo varchar(10),
	@CON_Descripcion varchar(200),
	@CON_FechaInico datetime,
	@CON_FechaFin datetime,
	@CON_EstadoContrato varchar(10),
	@IDCliente int,
	@CON_Estado varchar(1),
	@CON_UsuarioCreacion varchar(25),
	@CON_FechaHoraCreacion datetime,
	@CON_UsuaroModificacion varchar(25),
	@CON_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Contrato]
	SET [CON_Codigo] = @CON_Codigo, 
		[CON_Descripcion] = @CON_Descripcion, 
		[CON_FechaInico] = @CON_FechaInico, 
		[CON_FechaFin] = @CON_FechaFin, 
		[CON_EstadoContrato] = @CON_EstadoContrato, 
		[IDCliente] = @IDCliente, 
		[CON_Estado] = @CON_Estado, 
		[CON_UsuarioCreacion] = @CON_UsuarioCreacion, 
		[CON_FechaHoraCreacion] = @CON_FechaHoraCreacion, 
		[CON_UsuaroModificacion] = @CON_UsuaroModificacion, 
		[CON_FechaHoraModificacion] = @CON_FechaHoraModificacion
	WHERE [IDContrato] = @IDContrato

	SET NOCOUNT OFF
END

GO
