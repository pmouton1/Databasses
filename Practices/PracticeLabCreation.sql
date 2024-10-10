/*
drop database if exists [Flightspmouton_practice]
go

create database [Flightspmouton_practice]
go
*/

use [Flightspmouton_practice]
go

drop table if exists [FlightPassengers]

drop table if exists [ReservedFlights]

drop table if exists [Reservations]

drop table if exists [TravelAgents]

drop table if exists [Flights]

drop table if exists [Passengers]
go

Create Table [FlightPassengers] (
	FlightCode char(10) not null,
	DepartureDay Date not null, 
	ResCode Char(6) not null,
	PassengerId int not null,
	FFNumber Varchar(20),
	FFAirline Varchar(20),
	Seats Varchar(20),
	ETicketReceipt Varchar(100)

	Primary Key(FlightCode, DepartureDay, ResCode, PassengerId),
	--Foreign Key(ResCode) References(),
	--Foreign Key(PassengerId) References()
)
