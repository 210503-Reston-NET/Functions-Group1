drop table batch;
drop table trainers;
drop table associates;


create table associates
(
	id int identity primary key,
	associateName nvarchar(100) not null,
	associateLocale varchar(2) not null,
	revaPoints int not null,
	joinDate dateTime not null
);
create table trainers
(
	id int identity primary key,
	trainerName varchar(20) not null,
	campus varchar(3) not null,
	caffeineLevel int not null
);
create table batch
(
	id int identity primary key,
	associateID int references associates(id),
	trainerID int references trainers (id)
);

insert into associates (associateName, associateLocale, revaPoints, joinDate) values 
('Robbie', 'GA', 50, '2021-05-03 10:00:00'), ('Alex', 'MN', 50, '2021-05-03 10:00:00'), ('Jacob', 'FL', 0, '2020-05-03 12:34:56'), 
('Juniper', 'WA', 197,'2021-05-03 10:00:00'), ('Janel', 'AZ', 50, '2020-05-03 12:34:56'), ('James', 'PA', 18, '2021-05-03 10:00:00'),
('Phoebe', 'WA', 199, '2021-05-03 10:00:00');
insert into trainers (trainerName, campus, caffeineLevel) values
('Marielle', 'USF', 60), ('Pushpinder', 'UTA', 50), ('Nick', 'UTA', 75), ('Mark', 'WVU', 16), ('Fred', 'UTA', 25);
insert into batch (associateID, trainerID) values
(3,3), (1,4), (2,2), (4,1), (6,3), (7,1);



select * from associates;

-- first, I demonstrate some common math aggregate functions 
select count(revaPoints) from associates;

select Sum(revaPoints) from associates;

select avg(revaPoints) from associates;

select * from associates where revaPoints > (Select avg(revaPoints) from associates);

select * from associates where revaPoints < (Select avg(revaPoints) from associates);

-- next, I demo string scalars
select upper(associateName) from associates;

select concat('Associate ', associateName) from associates;

select concat(associateName, ' is paired with ',trainerName) as pairings from associates, trainers, batch where trainers.id = batch.trainerID and associates.id = batch.associateID;

-- moving on, i demo date/time scalars
select associateName, YEAR(joinDate) as year, joinDate from associates;

select associateName, joinDate as startDate, dateadd(day,67,joinDate) as endDate from associates;


-- now i demonstrate a user defined function
use ComputerShopDB
select dbo.timesTwo(revaPoints) from associates;

