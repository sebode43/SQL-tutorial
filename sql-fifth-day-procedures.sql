USE [CapstonePractice]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRequests]    Script Date: 2/4/2020 10:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[GetAllRequests]
as
begin
	Set nocount on --turns record counting off/makes scripts cleaner
	Declare cur cursor for --cursors do not start with the @sign
		Select distinct r.id from Requests r
		join requestLines rl
		on r.id = rl.requestid;
	Declare @id int;
		Open cur;
			fetch next from cur into @id;
			while @@Fetch_status = 0 --if fetch_status has a 0 it means there is still a new row
			begin
			print 'request id is '+ cast(@id as nvarchar(10));
			Exec UpdateRequestTotal @id;
			fetch next from cur into @id; --last thing in statement is whatever you do before you start the while loop because we will be checking the status right after we read the file
			end
		Close cur; --always close
		Deallocate cur; --gives the cursor back, so others can use
end
Go
EXEC GetAllRequests;
go

Select * from Requests;