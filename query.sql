/*
Select orders.id, customers.name, customers.address, items.id, items.name
items.price 
from items, customers, orders, order_items
where customers.id=orders.customer_id
and orders.id= order_items.order_id
and order_items.order_id= orders.id;
*/

Select *
from items, customers, orders, order_items
where customers.id=orders.customer_id
and orders.id= order_items.order_id
and order_items.order_id= items.id;

Select items.name, order_items.quantity from items, order_items
where items.id = order_items.item_id;

/* aliasi*/
Select i.name , oi.quantity from items i, order_items oi
where i.id = oi.item_id;

/* agregatne funkcije */
Select i.name , sum(oi.quantity )from items i, order_items oi
where i.id = oi.item_id
GROUP BY i.name;

Select i.name , oi.quantity from items i, order_items oi
where i.id = oi.item_id
ORDER BY i.name;


/* DISTINCT izbacuuje ponavljanje*/
Select  DISTINCT i.name , oi.quantity from items i, order_items oi
where i.id = oi.item_id
ORDER BY i.name;

/*  Interesuje nas sta se najvise prodaje */
Select i.name , max(oi.quantity )from items i, order_items oi
where i.id = oi.item_id
GROUP BY i.name;

/*  Sta se prodaje najvise u prosjeku */
Select i.name , avg(oi.quantity )from items i, order_items oi
where i.id = oi.item_id
GROUP BY i.name;


Select c.name, o.id from customers c, orders o
where c.id = o.customer_id;


Select c.name, count(o.id) from customers c, orders o
where c.id = o.customer_id
GROUP BY c.name;


Select c.name, count(oi.item_id) from customers c, orders o, order_items oi
where c.id = o.customer_id
and oi.order_id = o.id
GROUP BY c.name;

/* KOliko je neko kupio ukupn item-a */
Select c.name, sum(oi.quantity) from customers c, orders o, order_items oi
where c.id = o.customer_id
and oi.order_id = o.id
GROUP BY c.name;


Select order_id, sum(oi.quantity * oi.unit_price) from  order_items oi
GROUP BY oi.order_id;

Select order_id, sum(quantity * unit_price) total_price from  order_items oi
ORDER BY total_price DESC;


/* havinh umjesto where */

Select order_id, sum(quantity * unit_price) total_price from  order_items oi
Group BY order_id HAVING total_price >2 ORDER BY total_price DESC;

Select order_id, sum(quantity * unit_price) total_price from  order_items oi
where unit_price >= 1
Group BY order_id HAVING total_price >2 ORDER BY total_price DESC;

/*  Sabiranje stringova  pogresno daje rezultat 0.0*/
Select name +': ' +  address  as data from customers;
/*  Sabiranje stringova  pomocu || */
Select name || ': ' ||   address  as data from customers;

Select * from items where name = "Mlijeko";

/*LIKE nije case sensitive */
Select * from items where name like "Mlijeko";

Select * from items where upper(name ) = upper ("mlijeko") ;

Select * from items where name like "Mli____";

/* rijec% - pocetak rijeci 
   %rijec - kraj rijeci 
 */
Select * from items where name like "Mli%";










