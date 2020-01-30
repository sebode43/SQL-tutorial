/* To comment
	on multi-lines */

Select sum(sales) as 'Total Sales for Cincy & Cle',
	max(sales) as 'Highest Sales',
	min(sales) as 'Lowest Sales',
	avg(sales) as 'Average Sales',
	count(*) as 'Number of Customers'
from customers
	where city = 'cincinnati' or city = 'cleveland'
		--order by Sales DESC;

Select sum(sales) as 'Total Sales', City
	from customers
		--where sales > 50000
		group by city
			having sum(sales) > 600000;

