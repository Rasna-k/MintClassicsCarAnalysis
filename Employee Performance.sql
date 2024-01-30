#Employee Performance

#No of employees in each office
Select offices.officeCode,city,count(employeeNumber)
from 
offices join employees 
on 
offices.officeCode=employees.officeCode
group by officeCode

#get employee performance data
select e.employeeNumber,e.firstName,e.lastName,e.jobTitle,count(o.orderNumber) as TotalSales
from employees e
left join
customers as c 
on e.employeeNumber=c.salesRepEmployeeNumber
left join orders AS o 
ON c.customerNumber=o.customerNumber
GROUP BY employeeNumber
order by totalSales Desc