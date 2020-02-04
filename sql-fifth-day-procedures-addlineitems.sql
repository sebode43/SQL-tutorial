Alter procedure AddLineItem
	@requestdescription nvarchar(30),
	@productpartnbr nvarchar(30),
	@quantity int = 1
As
Begin
	Set nocount on;
	Declare @Requestid int, @Productid int;
	Select @requestid = id from requests where description = @requestdescription;
	Select @productid = id from products where partnbr = @productpartnbr;
	Insert into RequestLines ( RequestId, ProductId, quantity)
		values (@Requestid, @Productid, @quantity);
End
Go
Exec AddLineItem @requestdescription = 'Amazon Deliveries', @productpartnbr = '51';
Go

Select * from RequestLines where requestid = 1;