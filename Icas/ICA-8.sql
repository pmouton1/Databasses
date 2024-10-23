
/*

use ClassTrak
go

select cast(i.first_name + ' ' + i.last_name as varchar(30)) 'Instructor', cast(s.first_name + ' ' + s.last_name as varchar(30)) 'Student',  c.class_id 
from Instructors i full join classes c 
on c.instructor_id = i.instructor_id full join class_to_student cs 
on cs.class_id = c.class_id full join students s 
on s.student_id = cs.student_id 
where c.class_id in (94, 60) or c.class_id is null      


use Publishers
go 

select s.stor_name 'Store Name' 
from discounts d right outer join stores s
on d.stor_id = s.stor_id 
where d.stor_id is null      


use NorthwindTraders
go

declare @city varchar(10) = 'Seattle';

select s.CompanyName, s.City, p2d.ProductID, p2d.ProductName, p2f.ProductID 'Product with No Qty' 
from Suppliers s join products p2d 
on s.SupplierID = p2d.SupplierID join products p2f 
on s.SupplierID = p2f.SupplierID 
where p2f.UnitsInStock = 0 
order by s.CompanyName, p2d.ProductID      


*/

use ClassTrak
go

select r.ass_desc + '(' +  at.ass_type_desc + ')' as 'Desc(Type)', rs.score/MAX(rs.score) 'AVG'--, COUNT(rs.student_id) 'NumMarked'
from Requirements r join Results rs
on r.req_id = rs.req_id join Assignment_type at
on at.ass_type_id = r.ass_type_id
where rs.class_id = 88
group by 'Desc(Type)', rs.score
