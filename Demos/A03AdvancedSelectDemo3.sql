-- list of employees who live in cities
-- we have customers in
select e.FirstName, e.LastName
from Employees e
where e.City in ( select city
					from customers)

-- list of employees who live in the same city as ALFKI
select e.FirstName, e.LastName
from Employees e
where e.city = (select city
				  from customers
				where customerid = 'ALFKI')

-- list of employees who live in cities
-- we have customers in
--way to use EXISTS instead of IN
select e.FirstName, e.LastName
from Employees e
where exists ( select city
					from customers c
					where c.city = e.city)

--return all products 
--whose category is 'Confections'
select *
from products p
where p.CategoryID in (
--category of confections
select categoryid
from categories c
where c.CategoryName = 'Confections')

-- change the above to use EXISTS
select *
from products p
where exists (
--category of confections
select categoryid
from categories c
where c.CategoryID = p.CategoryID
and c.CategoryName = 'Confections'
)

--give me the company name and country
--of customers who have orders costing less than $15
--(cost = unitprice * quantity)
select c.CompanyName, c.Country --details for those customers
from customers c
where c.CustomerID in (
	select o.customerid --list of relevant customers
	from orders o
	where o.orderid in (
		select od.orderid --list of relevant orders
		from [Order Details] od
		where od.UnitPrice * od.Quantity < 15))

--no aliases to answer a question from a top student
select CompanyName, Country --details for those customers
from customers
where CustomerID in (
	select customerid --list of relevant customers
	from orders
	where orderid in (
		select orderid --list of relevant orders
		from [Order Details] 
		where UnitPrice * Quantity < 15))
