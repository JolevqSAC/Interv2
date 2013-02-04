IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativo_PERByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCorrelativo_PERByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativo_PERByIDLaboratorio]
(
	@IDLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[PER_Numero],
	[PER_Anio],
	[IDLaboratorio]
	FROM [Correlativo_PER]
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
