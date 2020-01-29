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