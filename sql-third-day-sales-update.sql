Select c.Name, c.City, c.State, c.Sales, o.ID as 'Order ID', o.date as 'Order Date', l.Product, l.Description, l.Quantity, l.Price
	from customers c
		join Orders o
			on o.customerID = c.ID
		join Orderlines l
			on l.ordersID = o.id
		where c.Name = 'Jungle Jims';

Select * from orders o
	join customers c
		on c.id = o.customerID
	where o.id = 34;

Update Customers set sales = (Select sum(l.quantity * l.price)
	from OrderLines l
	where l.OrdersID = 34)
	where customers.name = 'Jungle Jims';

Update Customers set sales = sales * 1.1
	where city = 'Columbus';

Update OrderLines set price = orderlines.quantity * 69.99
	where Product = 'My favorite Echo';

Update Orderlines set price = Orderlines.price * .9
	where id in (Select l.ID 
	from customers c
		join Orders o
			on o.customerID = c.ID
		join Orderlines l
			on l.ordersID = o.id
		where c.sales > 90000);