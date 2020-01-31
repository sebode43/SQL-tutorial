--primary key is the best to delete individual rows
select distinct description  from orderlines;

/*Delete from OrderLines
	where description = 'Timex';*/

Delete from OrderLines
	where id in (Select Orderlines.ID 
	from orderlines
		where description = 'Timex');