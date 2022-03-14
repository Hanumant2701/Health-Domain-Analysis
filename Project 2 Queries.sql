
-- KPI 1: No of Food Instruments Redeemed by Vendor Location

select `Vendor Location`, 
sum(`Number of Food Instruments Redeemed`) Number_of_Food_Instruments_Redeemed
from ds1
group by  `Vendor Location` 
order by Number_of_Food_Instruments_Redeemed desc;

-- Top 5

select `Vendor Location`, 
sum(`Number of Food Instruments Redeemed`) Number_of_Food_Instruments_Redeemed
from ds1
group by  `Vendor Location` 
order by Number_of_Food_Instruments_Redeemed desc limit 5;	 




-- KPI 2: No. of WIC Card Transactions Processed by Vandor Country

select   `Vendor Location`,sum(`Number of WIC Card Transactions Processed`) 
from ds1 
group by   `Vendor Location`
order by sum(`Number of WIC Card Transactions Processed`) desc;

-- Top 5

select `Vendor Location`,sum(`Number of WIC Card Transactions Processed`) 
from ds1 
group by `Vendor Location`
order by sum(`Number of WIC Card Transactions Processed`) desc limit 5;



-- KPI 3: Avg Cost per Family by Year

select `Obligation Year and Month`,
format(sum(`Average Cost per Family`),2) `Average Cost per Family`
from ds1
group by  `Obligation Year and Month`
order by `Obligation Year and Month` asc;



-- KPI 4: No. of Participants Redeemed by Participant Category

select `Participant Category`,
format(((sum(`Number of Participants Redeemed`)*100)/
(select sum(`Number of Participants Redeemed`) from ds2)),"2") `% of Total` 
from ds2 
group by `Participant Category`
order by sum(`Number of Participants Redeemed`) desc;



-- KPI 5: Total Cost Vouchar vs No. of Families Redeemed Food Benifits

select `Vendor Location`,
format(sum(`Number of Families Redeemed Food Benefits`),"0"),
format(sum(`Total Cost Vouchers`),"2") from ds1
join ds2
using (`Vendor Location`)
group by `Vendor Location`
order by `Vendor Location`;


