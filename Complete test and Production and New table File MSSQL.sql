Create database test_env;

use test_env;

select * from [dbo].[Test Environment Inventory Dataset]

select * from [dbo].[Products]

select Distinct(Product_ID) from [dbo].[Test Environment Inventory Dataset]

---------------------------------------Using the Left Join to merge the table so I can use in PowerBI as a one table--------------------------------------



select * from [dbo].[Test Environment Inventory Dataset] as TEID left join [dbo].[Products] as p
on 
TEID.Product_ID = p.Product_ID;

-------------------------------------- Reomve the Product ID because it comes two times---------------------------------------------------------------------

select TEID.Order_Date_DD_MM_YYYY, TEID.Product_ID, TEID.Availability, TEID.Demand, p.Product_Name, p.Unit_Price from [dbo].[Test Environment Inventory Dataset] as TEID left join [dbo].[Products] as p
on 
TEID.Product_ID = p.Product_ID;

-------------------------------------Now store this output into the new table--------------------------------------------------------------------------

select * into New_Table from (
select TEID.Order_Date_DD_MM_YYYY, TEID.Product_ID, TEID.Availability, TEID.Demand, p.Product_Name, p.Unit_Price from [dbo].[Test Environment Inventory Dataset] as TEID left join [dbo].[Products] as p
on 
TEID.Product_ID = p.Product_ID)  N

select * from New_Table;



----------------------------------------------- Creating The Production Database and table----------------------------------------------------------------

Create database PRODU

use PRODU

select * from [dbo].[Prod Env Inventory Dataset]

select * from [dbo].[Products]

select distinct(Product_ID) from [dbo].[Prod Env Inventory Dataset]
order by Product_ID

select distinct(Order_Date_DD_MM_YYYY) from [dbo].[Prod Env Inventory Dataset]

--Check the null values and Blank Values


select distinct(Order_Date_DD_MM_YYYY) from [dbo].[Prod Env Inventory Dataset]
where Order_Date_DD_MM_YYYY is Null or  Order_Date_DD_MM_YYYY = ''

select distinct(Product_ID) from [dbo].[Prod Env Inventory Dataset]
where Product_ID is Null or  Product_ID = ''

--A I have two extra values in prod env so I discuss with th team and thery told me 

-- Replace 21--->7
-- Replace 22--->11

Update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 7 where Product_ID =21 

Update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 11 where Product_ID =22

select distinct(Availability) from [dbo].[Prod Env Inventory Dataset]

select distinct(Demand) from [dbo].[Prod Env Inventory Dataset]

---------------------------------------Using the Left Join to merge the table so I can use in PowerBI as a one table--------------------------------------


select * from [dbo].[Prod Env Inventory Dataset] as PEID left join [dbo].[Products] as p
on 
PEID.Product_ID = p.Product_ID;

-------------------------------------- Reomve the Product ID because it comes two times---------------------------------------------------------------------

select PEID.Order_Date_DD_MM_YYYY, PEID.Product_ID, PEID.Availability, PEID.Demand, p.Product_Name, p.Unit_Price from [dbo].[Prod Env Inventory Dataset] as PEID left join [dbo].[Products] as p
on 
PEID.Product_ID = p.Product_ID;

-------------------------------------Now store this output into the new table--------------------------------------------------------------------------

select * into New_Table from (
select PEID.Order_Date_DD_MM_YYYY, PEID.Product_ID, PEID.Availability, PEID.Demand, p.Product_Name, p.Unit_Price from [dbo].[Prod Env Inventory Dataset] as PEID left join [dbo].[Products] as p
on 
PEID.Product_ID = p.Product_ID)  N

select * from New_Table;

---------------------------------------------Run Both the Table---------------------------------------------------------------------------------------

--Table 1 from Test_env Database
select * from New_Table;

--Table 2 --Table 1 from PRODU Database
select * from New_Table;





