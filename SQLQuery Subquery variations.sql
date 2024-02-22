
 --multi column subquery data fetching
--select * 
--from tblProduct as m
--where EXISTS (select p.ProductName,p.ProductCost
--					from tblProductCustomer as pc
--					inner join tblProduct as p
--					on pc.Productid_fk= p.ProductId
--					inner join tblCustomer as c
--					on c.CustomerId=pc.CustomerId_fk
--					where p.ProductName=m.ProductName and p.ProductCost=m.ProductCost
--					group by p.ProductName,p.ProductCost)

 --another multi column subquery data fetching from another level deeper
--select m.CategoryID,m.Price
--from Products as m
--where exists (select CategoryID,Price from
--                (SELECT p.CategoryID,max(p.Price) as Price
--                 FROM Products as p
--                 group by p.CategoryID) as temp
--              where temp.CategoryID=m.CategoryID and  temp.Price=m.Price
--             )
--             order by m.CategoryID

--Highet cost using corelated query
--select * from tblProduct as p1
--where 0 = (select count(distinct(p2.ProductCost)) from tblProduct as p2 
--where p2.ProductCost>p1.ProductCost)


--dump data in new table
--select * into tblProduct2 from tblProduct

--nested subquery (w3) category wise total prices that are greater than category wise total average
--select * from (
--            select CategoryID,sum(Price) as total_price
--                from Products
--                group by CategoryID
--            )
--       where total_price > (
--       select avg(total_price) as average_price
--              from (
--                  select CategoryID,sum(Price) as total_price
--                  from Products
--                  group by CategoryID
--                )
--       )