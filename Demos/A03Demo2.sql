use NorthwindTraders
go

select c.CustomerID, c.CompanyName, c.City
from customers c
where 
	c.City in ('Seattle', 'Tsawassen', 'Berlin', 'Madrid',
		'London')
and c.CompanyName like '[ABC]%[^s]'
--company name doesn't end in s and starts with A, B or C

--next problem
--return customers whose city name is 9 characters long
select *
from customers c
--where c.City like '_________'
where len(c.City) = 9

-- find the productid, productname
--of products who have a unitprice between $10 and $20
select p.ProductID, p.ProductName
from products p
where p.UnitPrice between 10 and 20

--for our customers,
--return the fax number. If fax is null, return phone instead
select c.CompanyName, coalesce(c.Fax, c.phone) 'Fax or Phone'
from customers c