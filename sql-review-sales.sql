Select * from Customers
order by sales;

Select avg(sales) as 'Average Sales' from Customers;

Select * from Customers
where sales > (Select avg(Sales) from Customers);

Select * from Customers
where sales > (Select max(sales) from Customers
where city = 'Columbus');

Select * from customers
where CHARINDEX('Bank', Name) > 0 or CHARINDEX('Cincinnati', City) > 0;

Select * from customers
where id = 8 or id = 11 or name = 'US Bank';

Select * from customers
where id = 8 and name = 'Fifth Third Bank';

Select sum(sales) as 'Cincinnati Total Sales', max(sales) as 'Cincinnati Highest Sales', min(sales) as 'Cincinnati Lowest Sales', count(*) as 'Cincinnati Number of Customers'
from Customers
group by city
	having city = 'Cincinnati'



/*alter procedure SalesRangeByCity -- must have everything else commented out
	@city varchar(30) = 'Cincinnati',
	@lowsales decimal(8,2) = 40000,
	@highsales decimal (8,2) = 70000
as
Begin

	select * from customers
		where city = @city and sales between @lowsales and @highsales; 
End




create procedure PriceRangebyProduct
@product nvarchar(30) = 'Echo Dot',
@lowprice decimal(8,2) = 20,
@highprice decimal(8,2) = 30
as
BEGIN
set nocount on;
select * from OrderLines where product = @product and price between @lowprice and @highprice;
END*/

