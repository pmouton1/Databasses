use NorthwindTraders
go 

declare @county varchar(10) = 'USA'

select s.CompanyName 'Company Name', p.ProductName 'Product Name', p.UnitPrice 'Unit Price' 
from suppliers s inner join products p 
on s.SupplierID = p.SupplierID 
where s.Country = @county
order by s.CompanyName, p.ProductName      

declare @city varchar(10) = 'Seattle' ;
 select e.LastName + ', ' + e.FirstName 'Name', t.TerritoryDescription 'Territory Description' 
 from Employees e join EmployeeTerritories et 
 on e.EmployeeID = et.EmployeeId join Territories t 
 on t.TerritoryID = et.TerritoryID 
 where e.City = @city 
 order by 2      

declare @discount float = 0.25; declare @freight int = 500 ; 

 select distinct c.CompanyName, p.ProductName 
 from Customers c join orders o 
 on c.CustomerID =  o.CustomerID join [Order Details] od 
 on od.OrderID = o.OrderID join Products p 
 on p.ProductID = od.ProductID 
 where od.Discount >= @discount and o.Freight > @freight 
 order by p.ProductName      

declare @days int = 30

select o.ShipName, p.ProductName, c.CategryName
from