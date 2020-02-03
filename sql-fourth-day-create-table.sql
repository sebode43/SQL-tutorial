--Create database Bootcamp; --[] = don't treat as keyword
	--use bootcamp;

/*Create table Students (
	Id int not null primary key identity(1,1),
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Active bit not null default 1,
	Birthday datetime not null,
	Loan decimal (8,2)
);*/

/*Insert into Students (FirstName, LastName, Birthday, Loan)
	values ('Kelly', 'Lopez', '1989-03-01', 12000.00);

Insert into Students (FirstName, LastName, Active, Birthday, Loan)
	values ('Jon', 'Detweiller', 0, '2000-05-05', 640.78);

Insert into Students (FirstName, LastName, Active, Birthday, Loan)
	values ('Jennifer', 'Shelton', 1, '1999-08-17', null);*/

/*Select * from Students;

Update Students set Loan = 0
	where Loan is null;

Create Table Technology (
	Id int not null primary key identity (100, 100),
	Name nvarchar(50) not null,
	PrimaryInstructor nvarchar(30) not null
);

Insert into Technology (Name, PrimaryInstructor)
	values ('.Net', 'Greg');

Insert into Technology (Name, PrimaryInstructor)
	values ('Java', 'Sean');

Create Table Cohort (
	Id int not null primary key identity(1,1),
	Starts datetime,
	Capacity int not null default 0,
	Enrolled int not null default 0,
	TechnologyId int foreign key references Technology (Id) 
);

Alter table Students
	alter column loan decimal (8,2) not null;

Alter table Students
	add constraint df_loan default 0 for loan; --constraint name needs to be added i.e. "df_loan"

Alter table Cohort
	add note nvarchar(80) not null;

alter table Cohort
	drop column note;*/