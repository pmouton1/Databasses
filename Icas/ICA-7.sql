use NorthwindTraders
go

/*

declare @country varchar(10) = 'USA' ;      

select s.CompanyName 'Company Name', p.ProductName 'Product Name', p.UnitPrice 'Unit Price' 
from suppliers s inner join products p 
on s.SupplierID = p.SupplierID 
where s.Country = @country 
order by s.CompanyName, p.ProductName 


declare @city varchar(10) = 'Seattle' ;

select e.LastName + ', ' + e.FirstName 'Name', t.TerritoryDescription 'Territory Description' 
from Employees e join EmployeeTerritories et 
on e.EmployeeID = et.EmployeeId join Territories t 
on t.TerritoryID = et.TerritoryID 
where e.City = @city 
order by 2 


declare @discount float = 0.25; 
declare @freight int = 500 ;      

select distinct c.CompanyName, p.ProductName 
from Customers c join orders o 
on c.CustomerID =  o.CustomerID join [Order Details] od 
on od.OrderID = o.OrderID join Products p 
on p.ProductID = od.ProductID 
where od.Discount >= @discount 
and o.Freight > @freight 
order by p.ProductName 


declare @max_date int = 30;

select o.ShipName, p.ProductName
from Products p join [Order Details] od
on p.ProductID = od.ProductID join Orders o
on od.OrderID = o.OrderID join Customers c
on o.CustomerID = c.CustomerID
where p.Discontinued = 1 
and datediff(dd, o.ShippedDate, o.RequiredDate) > @max_date
order by o.ShipName

*/


