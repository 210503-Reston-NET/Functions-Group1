USE FannerDogsDB
GO
Create function FindInState
(
	@StateLocated varchar(2)
)
returns table
as
return
select associateName 
from associates 
where associateLocale = @StateLocated;