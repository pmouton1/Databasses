/*
use master
go

drop database if exists pmouton1_ets
go
create database pmouton1_ets;
go
*/

use pmouton1_ets
go 

drop table if exists [TripLeg]
go	
drop table if exists [TripPlans]
go
drop table if exists [TransitLines]
go
drop table if exists [Stations]
go


create table [TripPlans] (

	TripPlanid int IDENTITY not null,
	PlanGenerated Datetime not null Default Getdate(),

	Primary key(TripPlanid)
);

create table [TransitLines] (
	
	TransitLine varchar(50),
	IntervalMins int not null Check(IntervalMins > 0)

	Primary Key(TransitLine)
);

CREATE TABLE Stations (

    	Station varchar(50),
    	StreetAddress varchar(30) NOT NULL,
	City varchar(30) NOT NULL DEFAULT 'Edmonton',
	Province char(2) NOT NULL DEFAULT 'AB',
	PostalCode char(7) Check(PostalCode like '[A-Z][0-9][A-Z] [0-9][A-Z][0-9]'),
	
	Primary Key(Station)
);

create table [TripLeg] (

	TripPlanid int not null,
	TransitLine varchar(50),
	StartStation varchar(50) not null,
	FinishStation varchar(50) not null,
	StartDeparture datetime not null,
	FinishArrival datetime not null,
	Duration as CAST((StartDeparture - FinishArrival) as int)


	Primary Key (TripPlanid, TransitLine),
	CONSTRAINT FK_TripLeg_Stations FOREIGN KEY (StartStation) REFERENCES Stations(Station),
	CONSTRAINT FK_TripLeg_FinishStations FOREIGN KEY (FinishStation) REFERENCES Stations(Station),
	CONSTRAINT FK_TripLeg_TripPlanid FOREIGN KEY (TripPlanid) REFERENCES TripPlans(TripPlanid),
	CONSTRAINT FK_TripLeg_TransitLines FOREIGN KEY (TransitLine) REFERENCES TransitLines(Transitline)
);



