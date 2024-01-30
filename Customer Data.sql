#Customer Data
select a.customerNumber,a.customerName,a.country,a.creditLimit,totalorders,totalPayment,(totalpayment-creditLimit) as creditlimitdiff
from
(select customerNumber,customerName,creditLimit,country
from
customers)a
left join 
(select customerNumber,count(orderNumber) totalorders
from
orders
group by customerNumber)b
on a.customerNumber=b.customerNumber
left join
(select customerNumber,sum(amount) totalPayment
from
payments
group by customerNumber)c
on b.customerNumber=c.customerNumber
group by customerNumber
order by totalPayment Desc;
