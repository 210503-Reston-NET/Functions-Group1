--for sql server--
drop table batch;
drop table trainers;
drop table associates;
--note that SQL is not case sensitive, it is case insensitive for keywords 
-- doesn't really care if I create a table via CREATE TABLE, create table, cReAte TaBlE
create table associates
(
	id int identity primary key,
	associateName nvarchar(100) not null,
	associateLocale varchar(2) not null,
	revaPoints int not null
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

insert into associates (associateName, associateLocale, revaPoints) values 
('Robbie', 'GA', 50), ('Alex', 'MN', 50), ('Jacob', 'FL', 0), ('Juniper', 'WA', 197), ('Janel', 'AZ', 50), ('James', 'PA', 18), ('Phoebe', 'WA', 199);
insert into associates (associateName, associateLocale, revaPoints) values
('Eva', 'MD',100), ('Venkata', 'CA', 100), ('Mykel','WA',60), ('Jean','FL',40),('John','TX',40);

insert into trainers (trainerName, campus, caffeineLevel) values
('Marielle', 'USF', 60), ('Pushpinder', 'UTA', 50), ('Nick', 'UTA', 75), ('Mark', 'WVU', 16), ('Fred', 'UTA', 25);
insert into batch (associateID, trainerID) values
(3,3), (1,4), (2,2), (4,1), (6,3), (7,1);

select associateName from associates where associateLocale = 'WA';
select count(associateLocale), associateLocale from associates group by associateLocale order by count(associateLocale) asc;
select count(associateLocale), associateLocale from associates group by associateLocale order by count(associateLocale) desc;
select * from associates where id in (select trainerID from batch);
select id from associates intersect select trainerID from batch;
--select a.id, a.associateName from associates a right outer join batch b on b.associateID  = a.id;
--select * from associates;

-- Add 5 associates to the associate table 
insert into associates (associateName, associateLocale, revaPoints) values
('Eva', 'MD', 100),('Venkata', 'CA', 100),('Mykel', 'WA', 75),('John', 'TX', 30),('Jean', 'FL', 50);

	-- Get all associates without a trainer
SELECT * FROM associates WHERE id NOT IN (SELECT trainerID FROM batch);
USE FannerDogsDB
Select dbo.printLastName (associateName) from associates
drop function dbo.printLastName
USE FannerDogsDB
select * from dbo.FindInState('WA');
USE FannerDogsDB
select * from dbo.ReturnLocations('WA','UTA');