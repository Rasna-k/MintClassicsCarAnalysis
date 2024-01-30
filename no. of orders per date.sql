#no. of orders per date 
select orderDate,totalOrders
from orders as o
left Join
	(select orderNumber,sum(quantityOrdered) totalOrders
	from orderdetails
	group by orderNumber) od
on o.orderNumber=od.orderNumber
order by orderDate