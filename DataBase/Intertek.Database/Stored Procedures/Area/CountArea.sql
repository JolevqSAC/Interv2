IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[CountArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[CountArea]
GO

CREATE PROCEDURE [dbo].[CountArea]
(
	@Where varchar(max)
)
AS
BEGIN
	SET NOCOUNT ON
declare @Query varchar(max)
 
if ISNULL(@Where, '') = '' 
begin
	set @Query = 'Select count(distinct IdArea) AS Cantidad from ViewArea' 
end
else 
begin
	set @Query = 'Select count(distinct IdArea) AS Cantidad from ViewArea where ' + @Where
end
 
Exec (@Query)


	SET NOCOUNT OFF
END

GO
