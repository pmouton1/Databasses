--display all the firstnames from NorthwindTraders Employees
--and the number of firstname matches in the Publishers 
--Authors table

--step 1: how do we get all the employees from NW?
select e.FirstName, e.LastName
from NorthwindTraders.dbo.Employees e

--step 2: how do we get all the employees from NW,
--and include any matching publisher's authors
--with the same first name?
select e.FirstName, e.LastName, a.au_fname, a.au_lname
from NorthwindTraders.dbo.Employees e
left join Publishers.dbo.authors a
on e.FirstName = a.au_fname

--step 3: use an aggregate to perform the count!
select e.FirstName, e.LastName, a.au_fname, count(a.au_id) NumMatches
from NorthwindTraders.dbo.Employees e
left join Publishers.dbo.authors a
on e.FirstName = a.au_fname
group by e.FirstName, e.LastName, a.au_fname

--display all the first initials from NorthwindTraders 
-- Employees
--and the number of firstname first initial matches in the 
--Publishers 
--Authors table
select left(e.FirstName, 1) 'Initial'
	, count(distinct a.au_id) NumMatches
from NorthwindTraders.dbo.Employees e
left join Publishers.dbo.authors a
on left(e.FirstName, 1) = left(a.au_fname, 1)
group by left(e.FirstName, 1)

--all firstnames from publishers
--all firstnames from northwind
--count of how many matches for that name
--Hajay's suggestion!!
select coalesce(e.FirstName, a.au_fname) 'Firstname', 
count(a.au_id) + count(e.EmployeeID) - 1 NumMatches
from NorthwindTraders.dbo.Employees e
full join Publishers.dbo.authors a
on e.FirstName = a.au_fname
group by coalesce(e.FirstName, a.au_fname)

--Just in CASE...
select coalesce(e.FirstName, a.au_fname) 'Firstname', 
count( case
		when e.EmployeeID is null then null
		when a.au_id is null then null
		else 1 end
) NumMatches
from NorthwindTraders.dbo.Employees e
full join Publishers.dbo.authors a
on e.FirstName = a.au_fname
group by coalesce(e.FirstName, a.au_fname)

--I want all the firstnames from employees @Northwind
-- who do not have a match in Publisher's authors
select e.FirstName, e.LastName, a.au_fname, a.au_lname
from NorthwindTraders.dbo.Employees e
left join Publishers.dbo.authors a
on e.FirstName = a.au_fname
where a.au_id is null

-- list the students who have never scored
-- less than 80% on any of their completed assessments
use ClassTrak
go

select s.first_name, s.last_name
from Students s
join results r
on r.student_id = s.student_id
join Requirements re
on r.req_id = re.req_id
group by s.first_name, s.last_name
having min(r.score*100.0/re.max_score) > 80

-- give me a list of instructors who have taught
-- students who never scored better than 80%
-- on any of their assessments
select distinct i.first_name, i.last_name
from Instructors i
join classes c
on i.instructor_id = c.instructor_id
join class_to_student cts
on cts.class_id = c.class_id
where cts.student_id in (

	--students who never scored above 80 in anything
	select s.student_id
	from students s
	join results r
	on r.student_id = s.student_id
	join Requirements re
	on re.req_id = r.req_id
	group by s.student_id
	having max(r.score*100.0/re.max_score) < 80 )
