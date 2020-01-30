Select avg (sales) as 'Average Sales'
	from customers;

Select * from customers
	where sales > 56951;

Select * from customers
	where sales > (Select avg(sales) from customers);

select max(sales) from Customers
	where city = 'Cleveland';

select * from customers
	where sales > (select max(sales) from Customers
	where city = 'Cleveland');