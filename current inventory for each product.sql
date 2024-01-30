#current inventory for each product
select products.productcode,productName,sum(quantityinstock),sum(quantityOrdered ),(sum(quantityInStock)-sum(quantityOrdered)) currentinventory
from products
left join
orderdetails
on products.productCode=orderdetails.productCode
group by productCode
order by currentinventory
