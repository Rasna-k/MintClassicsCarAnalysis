#profit/loss for each product per warehouse
select productCode,warehouseCode,investment ,revenue,(revenue-investment) as profit
from
(select products.productCode,warehouseCode,sum(buyPrice*quantityInStock) investment , sum(quantityOrdered * priceEach) revenue
from
products
join
orderdetails
on
products.productCode=orderdetails.productCode
group by warehousecode,productCode) a