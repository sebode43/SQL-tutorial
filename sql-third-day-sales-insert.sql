/*INSERT into Orders (CustomerID, Date, Description)
	Values (1, '2020-02-01','My first inserted order');--universal is year-month-day and the default time is midnight

Select * from Orders
	where id = (select max(id) from orders);

Insert into OrderLines (OrdersId, Product, Description, Quantity, Price)
	values (28, 'My favorite Echo', 'Amazon Echo', 3, 99.99); --numbers are not in quotes (only strings need quotes and dates)*/

Insert into customers (Name, City, State, Sales, Active)
	values ('Jungle Jims', 'Cincinnati', 'OH', 1, 1);

Insert into orders (CustomerID, Description)
	values ((Select ID from Customers
		where name = 'Jungle Jims'), 'Customer Order');

Insert into OrderLines (OrdersID, Product, Quantity, Price)
	values ((Select id from orders where Description = 'Customer Order'), 'Echo Dot', 1, 199.99);

Select * from orderlines