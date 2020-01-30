Select s.ID as 'Student ID', concat(s.Firstname, ' ', s.Lastname) as 'Student Name', m.Description as 'Major', 
	ClassID as 'Course Number', concat (c.Subject, ' ', c.Section) as 'Course Name', 
	concat(i.Firstname, ' ', i.Lastname) as 'Instructor Name'
	from Student s
	join StudentClassRel sc
		on s.ID = sc.studentID
	join Class c
		on sc.classID = c.ID
	join Instructor i
		on i.ID = c.InstructorID
	join Major m
		on s.MajorID = m.ID;
