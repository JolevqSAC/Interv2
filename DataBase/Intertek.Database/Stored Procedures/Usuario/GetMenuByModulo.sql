IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[GetMenuByModulo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[GetMenuByModulo]
GO

CREATE PROCEDURE [dbo].[GetMenuByModulo]
@IdModulo int
AS
BEGIN
	SET NOCOUNT ON

select
id as IdMenu,  
menuId as IdModulo 
--menuId = case when m.menuId is null then Id else m.menuId end 
,nombre
,nombre_us,
url,
orden
from Menu AS M 
WHERE M.estado = 1
and m.menuId=@IdModulo


	SET NOCOUNT OFF
END

GO
