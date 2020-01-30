Select * from customers
	where id = 8 or id = 11 or id = 12;

Select * from customers
	where charindex('Bank', Name) > 0;

Select * from customers
	where id in (8, 11, 12);

Select * from customers
	where id in (Select id from customers
	where charindex('Bank', Name) > 0 or CHARINDEX('eagle', name) > 0 or CHARINDEX('cardinal', name) > 0);