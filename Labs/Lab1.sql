
/*
drop database if exists [lab1ETS]
go
create database [lab1ETS];
go
*/

--drop table if exists [Stations]

CREATE TABLE Stations (

    Station varchar(50),
    StreetAddress varchar(30),
	City varchar(30),
	Province char(2),
	PostalCode char(7),
	PRIMARY KEY (Station)
	);

drop table if exists [TripLeg]

create table [TripLeg] (

	TripPlanid int,
	TransitLine varchar(50),
	StartStation varchar(50) not null,
	FinishStation varchar(50) not null,
	StartDeparture varchar(50) not null,
	FinishArrival varchar(50) not null,
	Duration varchar(1)
);

drop table if exists [TransitLine]

create table [TransitLine] (
	
	TransitLine varchar(50),
	IntervalMin int
);

drop table if exists [TripPlans]

create table [TripPlans] (

	TripPlanid int,
	Plangenerated varchar(50)
);
