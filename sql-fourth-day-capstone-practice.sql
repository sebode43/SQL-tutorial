use master;
go
drop database if exists CapstonePractice;
go
create database CapstonePractice;
go
use CapstonePractice;
go
Create table Users (
	Id int primary key identity (1,1),
	Username nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	FirstName nvarchar(30) not null,
	LastName nvarchar (30) not null,
	Phone nvarchar (12),
	Email nvarchar (100),
	IsAdmin bit not null default 0,
	IsReviewer bit not null default 0
);
go
Insert into Users (Username, Password, FirstName, LastName, Phone, Email, IsAdmin, IsReviewer)
	values ('klopez', '1234.passWord', 'Kelly', 'Lopez', '555-241-9010','klopez@maxtraining.com', 1, 1);
Insert into Users (Username, Password, FirstName, LastName, Phone, Email, IsAdmin, IsReviewer)
	values ('jdettweiler', '5678_PassWordforTraining', 'Jon', 'Detweiller', '555-777-3977','jdetweiller@maxtraining.com', 0, 1);
Insert into Users (Username, Password, FirstName, LastName, Phone, Email)
	values ('jshelton', 'Password#1234', 'Jennifer', 'Shelton', '555-444-7777','jshelton@maxtraining.com');
go
Create Table Vendors (
Id integer not null primary key identity (1,1),
Code nvarchar(30) not null unique,
Name nvarchar(30) not null,
Address nvarchar(30) not null,
City nvarchar(30) not null,
State nvarchar(2) not null,
Zip nvarchar(5) not null,
Phone nvarchar(12),
Email nvarchar(255)
);
go
Insert into Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
	values('Amzn', 'Amazon', '4545 Amazon Way', 'Seattle', 'WA', '55555','555-800-9227', 'amazon@email.com');
Insert into Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
	values('Kgr', 'Kroger', '4321 Main Street', 'Cincinnati', 'OH', '45241', '513-999-0010', 'kroger@email.com');
Insert into Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
	values('Wlmrt', 'Walmart', '9454 Walmart Lane', 'Little Rock', 'AR', '33333', '333-800-9010', 'walmart@email.com');
Insert into Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
	values('Tgt', 'Target', '2211 Target Avenue', 'Cincinnati', 'OH', '45241', '513-999-7574', 'target@email.com');
Insert into Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
	values('Mjr', 'Meijer', '5678 Central Parkway', 'Cincinnati', 'OH', '45241', '513-987-7980', 'meijer@email.com');
go
Create table Products (
Id int not null primary key identity (1,1),
PartNbr nvarchar(30) not null unique,
Name nvarchar(30) not null,
Price decimal(11,2) not null default 10,
Unit nvarchar(30) not null,
PhotoPath nvarchar(255),
VendorId int not null foreign key references Vendors (Id)
);
go
Insert into Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
	values ('51', 'Pound of Apples', '8.99', '1', 'photopath.com', (select id from Vendors where code = 'Kgr'));
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('11', 'Nikon Camera', '399.99', '1', (select id from Vendors where code = 'Amzn'));
Insert into Products (PartNbr, Name, Price, Unit, PhotoPath, VendorId)
	values ('40', 'Yearly Planner', '5.50', '1', 'photopath.com/product', (select id from Vendors where code = 'Tgt'));
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('82', 'Chemistry Set', '29.99', '1', (select id from Vendors where code = 'Wlmrt'));
go
Create Table Requests (
Id int not null primary key identity (1,1),
Description nvarchar(80) not null,
Justification nvarchar(80) not null,
RejectionReason nvarchar(80),
DeliveryMode nvarchar(20) not null default 'Pickup',
Status nvarchar(10) not null default 'New',
Total decimal(11,2) not null default 0,
UserId int not null foreign key references Users (Id)
);
go
Insert into Requests(Description, Justification, RejectionReason, DeliveryMode, Status, Total, UserID)
	values ('Amazon Deliveries', 'Paused', 'No Code', 'InStore', 'Delivered', 234.97, (select id from Users where Lastname = 'Lopez'));
Insert into Requests(Description, Justification, Total, UserID)
	values ('Delivery to J. Detweiller', 'None Needed', 499.86, (select id from Users where Lastname = 'Detweiller'));
Insert into Requests(Description, Justification, DeliveryMode, Status, Total, UserID)
	values ('Nikon Camera to J.Shelton', 'None Needed', 'Deliver to Office', 'Shipped', 399.99, (select id from Users where Lastname = 'Shelton'));
go
Create Table RequestLines (
Id int not null primary key identity (1,1),
RequestId int not null foreign key references Requests (Id),
ProductID int not null foreign key references Products (Id),
Quantity int not null default 1
);
go
Insert into RequestLines(RequestId, ProductID, Quantity)
	values (1, (select id from Products where Name = 'Yearly Planner'), '4');
Insert into RequestLines(RequestId, ProductID, Quantity)
	values (2, (select id from Products where Name = 'Chemistry Set'), '24');
Insert into RequestLines(RequestId, ProductID, Quantity)
	values (3, (select id from Products where Name = 'Nikon Camera'), '1');
go
Create procedure UpdateRequestTotal
	@Requestid int --put parameters in after procedure before as
as
Begin
	Set nocount on;
	Update Requests set Total = (Select sum(rl.quantity * p.price) as 'Request Total' from Requests r
		join Requestlines rl
			on rl.requestid = r.id
		join Products p
			on rl.ProductID = p.id
			where r.id = @requestid)
		where id = @requestid;
END
go
Select * from requests
	where id = 1 or id = 2 or id = 3
	order by Description