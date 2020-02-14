Create Table School(
ID int not null primary key identity(1,1),
SchoolName nvarchar(50) not null,
Active bit not null default 1,
StartDate datetime,
)

Insert into School (SchoolName, StartDate) values ('University of Cincinnati', '2020-07-15');

Select * from School


Update School set StartDate = '2020-07-15';

Insert into School(SchoolName, StartDate)
values('University of Dayton', '2020-08-03')

Delete from School
where SchoolName = 'University of Chicago'

Create table Departments(
ID int not null primary key identity(1,1),
DepartmentName nvarchar(30),
DepartmentHead nvarchar(30),
SchoolID int not null foreign key references School(ID)
)

Insert into Departments(DepartmentName, DepartmentHead, SchoolID)
values ('English', 'Kelly Hudson', (select ID from School where SchoolName = 'University of Cincinnati'))

Insert into Departments(DepartmentName, DepartmentHead, SchoolID)
values ('Math', 'Kelly Hudson', (select ID from School where SchoolName = 'University of Cincinnati'))

Alter table Departments
alter column DepartmentName nvarchar(30) not null

Update Departments set DepartmentHead = 'John Shelton'
where DepartmentName = 'Math'

Select * from Departments d
join School s
on d.SchoolID = s.id
order by SchoolName

Select StudentID, concat(FirstName,' ', LastName) as 'Student Name', SAT, GPA, ClassID, concat(Subject, ' ', Section) as 'Course' from StudentClassRel sc
join Student s
on sc.StudentId = s.Id
join class c
on sc.ClassId = c.id
order by StudentId