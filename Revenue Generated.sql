#Revenue by each product
select products.productCode,productName,sum(quantityOrdered) as total,sum(quantityOrdered * priceEach) as revenueByEachProduct
from orderdetails
join products
on
products.productCode=orderdetails.productCode
group by productCode
ORDER by revenueByEachProduct

#revenue per warehouse
select warehouseName,sum(quantityOrdered * priceEach) revenuePerWarehouse
from (products
join orderdetails
on products.productCode=orderdetails.productCode)
join warehouses
on warehouses.warehouseCode=products.warehouseCode
group by warehouseName

#revenue for each product line
select productLine,sum(quantityOrdered * priceEach) revenuePerProductLine
from products
join orderdetails
on products.productCode=orderdetails.productCode
group by productLine

#total revenue for each product
select products.productCode ,productName, sum(quantityOrdered * priceEach) revenue
from
products
join
orderdetails
on
products.productCode=orderdetails.productCode
group by productCode