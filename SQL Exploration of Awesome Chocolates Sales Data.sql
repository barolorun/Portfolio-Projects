--Let us see the SalesData table
Select *
from SalesData


--Let us transform the data to remove spaces in the Country column and replace zeros with 'General' in the Team column
Select Region, Salesperson, Product, "Date", Amount, Customers, Boxes, TRIM(Country) as Country_n, REPLACE(Team, 0, 'General') as Team_n
from SalesData


--Let us see the sales performances of the regions for the whole year
Select Region, Sum(Amount) as "Total Sales"
from SalesData
Group by Region
Order by Sum(Amount) desc


--Let us see the sales recorded in each month globally
Select MONTH("Date") as "Month", Sum(Amount) as "Total Sales"
from SalesData
Group by Month("Date")
Order by Sum(Amount) desc


--Based on our previous query, highest sales were recorded globally in December. Let us break it down by region
Select Region, Sum(Amount) as "Total Sales"
from SalesData
Where MONTH("Date") = 12
Group by Region
Order by Sum(Amount) desc


--Lowest global sales were recorded in September. Let us also break it down by region
Select Region, Sum(Amount) as "Total Sales"
from SalesData
Where MONTH("Date") = 9
Group by Region
Order by Sum(Amount) desc


--Let us see the countries with maximum and minimum annual sales globally
Select TRIM(Country) as Country_n, Sum(Amount) as Total_sales
from SalesData
Group by TRIM(Country)
Order by Sum(Amount) desc


--Let us see the best and the worst selling products of the year
Select Product, Sum(Boxes) as "Total Boxes Sold"
from SalesData
Group by Product
Order by Sum(Boxes) desc


--Let us rank the teams by annual performance
Select REPLACE(Team, 0, 'General') as Team_n, Sum(Amount) as "Total Sales"
from SalesData
Group by REPLACE(Team, 0, 'General')
Order by Sum(Amount) desc


--Let us rank the salespersons by annual performance
Select Salesperson, Sum(Amount) as "Total Sales"
from SalesData
Group by Salesperson
Order by Sum(Amount) desc