#Get total stock in each warehouse
select warehouseName,sum(quantityInStock)
from
warehouses
join
products
on
warehouses.warehouseCode=products.warehouseCode
group by warehouseName

#get total stock for each productline
select warehouseName,productLine,sum(quantityInStock) TotalStock
from products 
join
warehouses
on
warehouses.warehouseCode=products.warehouseCode
group by warehouseName,productLine

#quantity in stock per product
select productcode,productName,sum(quantityinstock)
from products
group by productCode

#quantity in stock per product per warehouse
select warehouseCode,productCode,sum(quantityInStock)
from products
group by warehouseCode,productCode

#quantity in stock vs. Quantity sold per product for warehouse c
select products.productcode,sum(quantityinstock),sum(quantityOrdered ),warehouseCode
from products
join
orderdetails
on products.productCode=orderdetails.productCode
where warehouseCode= 'c'
group by productCode

#quantity in stock vs. Quantity sold per product per warehouse
select products.productcode,sum(quantityinstock),sum(quantityOrdered ),warehouseCode
from products
join
orderdetails
on products.productCode=orderdetails.productCode
group by warehouseCode,productCode
order by warehouseCode

#percentage of products orders as compared to stock per warehouse
select warehouseCode,sum(quantityinstock),sum(quantityOrdered),(sum(quantityOrdered)/sum(quantityInStock))*100 as percentageordered
from products
join
orderdetails
on products.productCode=orderdetails.productCode
group by warehouseCode