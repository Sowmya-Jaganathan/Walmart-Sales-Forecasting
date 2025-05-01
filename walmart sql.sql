CREATE DATABASE walmart_db;
USE walmart_db;
CREATE TABLE walmart_sales (
    Store INT,
    Department VARCHAR(20),
    Date DATE,
    Product_Category VARCHAR(50),
    Customer_Type VARCHAR(20),
    Supplier_ID VARCHAR(20),
    Weekly_Sales FLOAT,
    Units_Sold INT,
    Unit_Price FLOAT,
    Inventory_Level FLOAT,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    CPI FLOAT,
    Unemployment FLOAT
);
select*from walmart_sales;
SELECT Store, ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales DESC;


SELECT 
    MONTH(Date) AS Month,
    YEAR(Date) AS Year,
    ROUND(SUM(Weekly_Sales), 2) AS Monthly_Sales
FROM walmart_sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
SELECT Product_Category, ROUND(SUM(Weekly_Sales), 2) AS Sales
FROM walmart_sales
GROUP BY Product_Category
ORDER BY Sales DESC;

SELECT Store, ROUND(AVG(Inventory_Level), 2) AS Avg_Inventory
FROM walmart_sales
GROUP BY Store
ORDER BY Avg_Inventory DESC;
SELECT Customer_Type, SUM(Units_Sold) AS Total_Units, ROUND(SUM(Weekly_Sales), 2) AS Total_Spent
FROM walmart_sales
GROUP BY Customer_Type;
SELECT Supplier_ID, ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Supplier_ID
ORDER BY Total_Sales DESC
LIMIT 5;

SELECT Product_Category, ROUND(AVG(Unit_Price), 2) AS Avg_Price, SUM(Units_Sold) AS Total_Units
FROM walmart_sales
GROUP BY Product_Category
ORDER BY Total_Units DESC
LIMIT 10;

SELECT 
    QUARTER(Date) AS Quarter,
    YEAR(Date) AS Year,
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY YEAR(Date), QUARTER(Date)
ORDER BY Year, Quarter;


