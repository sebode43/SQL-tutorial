/*select * from customers
	where city = 'Cincinnati' and sales > 40000 and sales < 70000;--ABC Analysis
	select * from customers
	where city = 'Cincinnati' and sales between 40000 and 70000; --ABC Analysis

Declare @city varchar(30) = 'Cincinnati';
declare @lowsales decimal(8,2) = 40000;
declare @highsales decimal (8,2) = 70000;

--set @lowsales = 40000
--set @highsales = 70000

select * from customers
	where city = @city and sales between @lowsales and @highsales; --ABC Analysis*/

alter procedure SalesRangeByCity --to create use create instead of alter
	@city varchar(30) = 'Cleveland',
	@lowsales decimal(8,2) = 30000,
	@highsales decimal (8,2) = 85000 --these are the default values in the procedure
as
Begin

	select * from customers
		where city = @city and sales between @lowsales and @highsales; --Procedure Body
End --to execute use exec [procedure name] to change parameters enter [parameter], [parameter], [etc]

-- exec SalesRangeByCity 'Cincinnati', 40000, 70000; needs to have the first if you are going to have the second and so on
-- exec SalesRangeByCity @lowsales = 40000, @highsales = 70000; --can be in any order