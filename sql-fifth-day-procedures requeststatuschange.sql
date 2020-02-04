Alter procedure StatusChange
@RequestID int,
@IsApproved bit = 1
AS
BEGIN
	Set nocount on;
	Declare @Status nvarchar(10);
	if @IsApproved = 1
		Begin 
		Set @status = 'Approved'
		End
		if @IsApproved = 0
		Begin 
		Set @status = 'Rejected'
		End
	Update Requests set status = @status
		where id = @requestid;
END
GO
Exec StatusChange @requestid = 3, @isApproved = 1;
GO
Select * from Requests