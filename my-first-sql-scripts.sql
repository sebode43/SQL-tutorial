--Select * from Student
--where GPA < 3.0
--order by SAT desc;

--Select * from student;
--Select * from major;

Select student.ID, concat (Firstname, ' ', LastName) as 'Name', SAT, GPA,
	isnull(Description, 'Undecided') as 'Major', 
	isnull(MinSAT, '') as 'Min SAT Required'
	from Student
	left join Major
		on Major.id = student.majorid;

Select concat (firstname, ' ', lastname) as 'Instructor', yearsexperience as 'Years of Experience', C.id as 'Course Code', isTenured, concat ( Subject, ' ', Section) as 'Class'
	from Instructor I
	join Class C
		on I.id = C.instructorid
		where I.IsTenured = 1
		order by I.Lastname asc;