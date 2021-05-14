use FannerDogsDB
go
Create Function ReturnLocations
(
	@StateLocated varchar(2),
	@CampusLocated varchar(3)
)
Returns
@locations table(
	id int,
	location varchar(3)
)
as
begin
	insert into @locations
	select
		id,
		associateLocale
	from
		associates
	where
		associateLocale = @StateLocated;

	insert into @locations
	select
		id,
		campus
	from 
		trainers
	where
		campus = @CampusLocated
	return
end