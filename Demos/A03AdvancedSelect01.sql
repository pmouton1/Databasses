use sdytiuk_Northwind
go

-- how many employees are there?
select * 
from Employees
where FirstName like 'M%'

--count(*) is the count of the number of rows
--count(column) counts the number of NOT NULL
select count(*) 'ALL ROWS', 
count(e.employeeid) 'Employee ID', 
count(e.Region) 'Region',
--replace nulls with AB, creating a second region...
count(distinct coalesce(e.Region,'AB')) 'Distinct Regions'
from Employees e

--we want stats for all employees who start with M in first name
select count(*) 'ALL ROWS', 
count(e.employeeid) 'Employee ID', 
count(e.Region) 'Region',
count(distinct coalesce(e.Region,'AB')) 'Distinct Regions'
from Employees e
where e.FirstName like 'M%'

--aggregate functions:
-- count, sum, avg, min, max
-- oldest and youngest employees!!
select min(e.BirthDate) 'Oldest Birthday', 
	max(e.birthdate) 'Youngest Birthday'
from Employees e

--how do you get the records associated with those birthdays?
--oldest - use variable

declare @oldest date
select @oldest = min(e.BirthDate)
from Employees e

select *
from Employees 
where BirthDate = @oldest 

--subquery for the youngest
select *
from Employees
where BirthDate = (select max(e.birthdate) 'Youngest Birthday'
					from Employees e)

-- find how many employees were born in each month
select month(birthdate) 'Month', count(*) Num
from Employees
group by month(birthdate)