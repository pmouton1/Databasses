--If I am in a database, I can't drop the current
--database
use sdytiuk_Northwind
go

/*
--create a games database
--with a players table
drop database if exists sdytiuk_games
go

--create the database
create database sdytiuk_games
go
*/
--switch the context to the new db
use sdytiuk_games
go

create table players
(
	playerid int identity primary key,
	first varchar(50) not null,
	last varchar(50) not null,
	gender char(1),
	birthday date not null,
	--CALCULATED!!
	age as datediff(YY,birthday,getdate())

)


select *
from players

insert into players (first, last, gender, birthday)
values ('Connor', 'McDavid', 'M', '1997-01-13')
