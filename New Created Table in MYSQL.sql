use PRODU

Create table New_Table as
select  
PEID.`Order Date (DD/MM/YYYY)` as `Order_Date_DD_MM_YYYY`, 
PEID.`Product ID` as `Product_ID`, 
PEID.`Availability` as `Availability`, 
PEID.`Demand` as `Demand`, 
p.`Product Name` as `Product_Name`, 
p.`Unit Price ($)` as `Unit_Price`
from 
produ.`prod+env+inventory+dataset` as PEID left join produ.products as p
on 
PEID.`Product ID` = p.`Product ID`