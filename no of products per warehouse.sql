Select * from warehouses
Select * from products
select * from orderdetails

#no of products per warehouse
Select warehouseCode,count(*) as sumofProducts
from products
group by warehouseCode
