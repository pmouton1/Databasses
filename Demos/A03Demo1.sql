use sdytiuk_Northwind
go

--select all rows and all columns
select * --* means ALL columns...
from Customers

--how to select selected columns?
select CompanyName, ContactName, City
from Customers

-- how do we pick only customers located in Buenos Aires
-- putting weird casing in your commands means PENALTY!!
SELEct CompanyName, ContactName, City
fROM Customers
WhErE City = 'Buenos Aires'

--we want all cities that start with B
--CONTRIVING QUERY == BAD
SELEct CompanyName, ContactName, City
fROM Customers
WhErE City = 'Buenos Aires'
or city = 'Berlin'
or city = 'Bern'

--we want all cities that start with B
select CompanyName, ContactName, City
from Customers
where City like 'B%'

--what about all cities that have a B in the name??
select CompanyName, ContactName, City
from Customers
where City like '%'

--what do we think the % does??
-- % matches ANY character including no character
--testing with NULL
select CompanyName, ContactName, City, Region
from Customers
where region like '%'
or region is null --IS NULL is how you match a null
--NULL = NULL is always false...

--Alias - in this example, table employees has alias e
select e.FirstName, e.LastName, e.BirthDate
from Employees e

select Employees.FirstName, LastName, BirthDate
from Employees

use master
go

--use fully qualified database name to use nw traders
select e.FirstName, e.LastName
from sdytiuk_Northwind.dbo.Employees e

use sdytiuk_Northwind
go
--ordering results
--we want all employees in order of
--youngest to oldest
select e.FirstName, e.LastName, e.BirthDate
from Employees e
order by e.BirthDate DESC

--*Practice*
--Get the employees who have an A in the last name
--in order from oldest to youngest
select e.FirstName, e.LastName, e.BirthDate
from Employees e
where e.LastName like '%a%'
order by e.BirthDate ASC

--find the youngest 3 employees
select top 3 e.FirstName, e.LastName, e.BirthDate
from Employees e
order by e.BirthDate DESC

--oldest 3 employees including any ties in 3rd place
select top 3 with ties e.FirstName, e.LastName, e.BirthDate, e.EmployeeID
from Employees e
order by e.BirthDate

update Employees
set BirthDate = '1979-02-19'
where EmployeeID = 5

--look at customers - city and country
--we want a list of each city and country
--associated to customers
--with no duplicates!!
select distinct c.City, c.Country
from customers c





