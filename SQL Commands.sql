create table Vehicle
(
    Id int primary key identity(1,1),
    Brand varchar(128),
    Model varchar(128)
)

create table Employee
(
    Id int primary key identity(1,1),
	Name varchar(128),
	[Function] varchar(64),
	BirthDate date,
	AdmissionDate date
)

create table Route
(
    Id int primary key identity(1,1),
	Descrition varchar(512)
)

create table Itinerary
(
    Id int primary key identity(1,1),
	StartHour varchar(6),
	EndHour varchar(6)
)

create table Travel
(
    Id int primary key identity(1,1),
    IdVehicle int,
    IdDriver int,
    IdRoute int,
    IdItinerary int,
    Value float,
    VehiclePosition varchar(32),
    Status varchar(16),
	ScheduleDate Date,
    FOREIGN KEY (IdVehicle) REFERENCES Vehicle(Id),
    FOREIGN KEY (IdDriver) REFERENCES Employee(Id),
    FOREIGN KEY (IdRoute) REFERENCES Route(Id),
    FOREIGN KEY (IdItinerary) REFERENCES Itinerary(Id),
    
)

/*
 * inclusão de Veículo
 */
insert into Vehicle (Brand, Model) values ('Brand1', 'Model1')

insert into Employee (Name, [Function], BirthDate, AdmissionDate) values ('João Silva', 'Motorista', '1985-12-25', '2016-07-07')

insert into Route (Descrition) values ('Ferrazopolis - Paço')

insert into Itinerary (StartHour, EndHour) values ('01:00', '02:00')

insert into Itinerary (StartHour, EndHour) values ('01:00', '03:00')

/*
 * Inclusão de Viagens
 */
insert into Travel (IdVehicle, IdDriver, IdRoute, IdItinerary, Value, VehiclePosition, Status, ScheduleDate) values (1, 1, 1, 1, '7.89', 'Ida', 'Em Andamento', '2018-12-19')
insert into Travel (IdVehicle, IdDriver, IdRoute, IdItinerary, Value, VehiclePosition, Status, ScheduleDate) values (1, null, 1, 2, '7.89', 'Ida', 'Em Andamento', '2018-12-19')
insert into Travel (IdVehicle, IdDriver, IdRoute, IdItinerary, Value, VehiclePosition, Status, ScheduleDate) values (1, null, 1, 1, '7.89', 'Ida', 'Em Andamento', '2018-12-20')

select Travel.Id, Travel.IdVehicle, Travel.IdDriver, Travel.IdRoute, Travel.IdItinerary, Travel.Value, Travel.VehiclePosition, Travel.Status, Travel.ScheduleDate,
	Itinerary.StartHour, Itinerary.EndHour
from Travel
inner join Itinerary on Travel.IdItinerary = Itinerary.Id

/*
 * Atualização de viagens concluídas
 */
update Travel
set Travel.Status = 'Concluído'
from Travel
inner join Itinerary on Travel.IdItinerary = Itinerary.Id
where Itinerary.EndHour < FORMAT(GETDATE(),'hh:mm') and Travel.ScheduleDate <= FORMAT(GETDATE(),'yyyy-MM-dd') and Travel.Status <> 'Concluído'

select Travel.Id, Travel.IdVehicle, Travel.IdDriver, Travel.IdRoute, Travel.IdItinerary, Travel.Value, Travel.VehiclePosition, Travel.Status, Travel.ScheduleDate,
	Itinerary.StartHour, Itinerary.EndHour
from Travel
inner join Itinerary on Travel.IdItinerary = Itinerary.Id

/*
 * Lista todas as Viagens (com e sem motorista definido
 */
select Travel.Id, Travel.IdVehicle, Travel.IdDriver, Travel.IdRoute, Travel.IdItinerary, Travel.Value, Travel.VehiclePosition, Travel.Status, Travel.ScheduleDate,
	Employee.Name
from Travel
left join Employee on Travel.IdDriver = Employee.Id

/*

select Id, Brand, Model from Vehicle
select Id, Name, [Function], BirthDate, AdmissionDate from Employee
select Id, Descrition from Route
select Id, StartHour, EndHour from Itinerary
select Id, IdVehicle, IdDriver, IdRoute, IdItinerary, Value, VehiclePosition, Status from Travel
*/