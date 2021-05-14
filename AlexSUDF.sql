USE FannerDogsDB
GO
Create function printLastName
(
	@FirstName varchar(100)
)returns varchar(30)
as 
begin
declare @LastName varchar(20);
set @LastName = ' Smith';
return concat(@FirstName, @LastName);
end
