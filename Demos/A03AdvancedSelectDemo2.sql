use NorthwindTraders
go

--what if we only want to know about months
--that have more than 1 employee's birthdate in it?
select month(birthdate) 'Month', count(*) Num
from Employees
group by month(birthdate)
having count(*) > 1

--which 5 cities have the most customers in them?
select top 5 with ties c.City --, count(*)
from customers c
group by c.City
order by count(*) desc

--which 5 cities have the most customers in them?
--we only want cities that don't start with M
select top 5 with ties c.City , count(*)
from customers c
where c.City not like 'M%'
group by c.City
order by count(*) desc

--what 3 cities have the most customers in them,
--where the number of customers are even?
select top 3 with ties c.City , count(*)
from customers c
group by c.City
having count(*) % 2 = 0
order by count(*) desc

--I want all this:
--how many employees
--oldest birthday
--youngest birthday
--average age
--how many different postal codes the employees have
--the sum of everyone's current age
--Your name as report author
--count of how many repeating postal codes there are
select count(*) 'How Many Employees',
	min(e.BirthDate) 'Oldest Birthday',
	max(e.BirthDate) 'Youngest Birthday',
	avg(datediff(yy,e.BirthDate,getdate())) 'Avg Age',
	count(distinct e.PostalCode) 'Diff PCs',
	sum(datediff(yy,e.BirthDate,getdate())) 'Sum Ages',
	'Steven' 'Name',
	count(e.PostalCode) - count(distinct e.PostalCode) 'Repeating PCs'
from Employees e

use Publishers
go

select * from titles

--how many titles in each type of book?
select t.type, count(*) 'Num Titles'
from titles t
group by t.type

--what's the total ytd sales for each type of book
--only include books where the number of titles is odd
--and whose titles start with a vowel
select t.type, sum(t.ytd_sales) 'YTD Sales'
from titles t
where t.title like '[AEIOUY]%'
group by t.type
having count(*) % 2 = 1