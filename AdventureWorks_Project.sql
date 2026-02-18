-- E-COMMERCE PROJECT


-- REDUCED TABLE OF SALES ORDERS
SELECT
SalesOrderID, OrderDate, CustomerID, TerritoryID, TotalDue
FROM Sales.SalesOrderHeader;

-- REDUCED TABLE OF ORDERS DETAILS
SELECT
SalesOrderID, OrderQty,ProductID, UnitPrice
FROM Sales.SalesOrderDetail;

-- REDUCED TABLE OF PRODUCTS CATEGORYS
SELECT
ProductCategoryID, Name AS Category
FROM Production.ProductCategory;


-- REDUCED TABLE OF PRODUCTS SUBCATEROGYRS
SELECT
ProductSubcategoryID, ProductCategoryID, Name AS Subcategory
FROM Production.ProductSubcategory;


SELECT
ProductID, Name, ProductSubcategoryID
FROM Production.Product;

-- DEBEMOS REEMPLAZAR LOS NULOS POR LOS VALORES DE LAS SUBCATEGORIAS CORRRESPONDIENTE A CADA PRODUCTO PARA PODER HACAR UN ANALISIS A NIVEL CATEGORIAS.

SELECT
    p.ProductID,
    p.Name AS Product,
    
    -- Handle NULL for ProductCategoryID using COALESCE and CASE
    COALESCE(psc.ProductCategoryID, 
        CASE
            -- Bikes category
            WHEN p.Name LIKE '%Mountain%' THEN 1
            WHEN p.Name LIKE '%Road%' THEN 1
            WHEN p.Name LIKE '%Touring%' THEN 1

            -- Components category
            WHEN p.Name LIKE '%Crankarm%' THEN 2
            WHEN p.Name LIKE '%Chainring%' THEN 2
            WHEN p.Name LIKE '%Fork%' THEN 2
            WHEN p.Name LIKE '%Headset%' THEN 2
            WHEN p.Name LIKE '%Pedal%' THEN 2
            WHEN p.Name LIKE '%Brake%' THEN 2
            WHEN p.Name LIKE '%Derailleur%' THEN 2
            WHEN p.Name LIKE '%Bottom Bracket%' THEN 2
            WHEN p.Name LIKE '%Saddle%' THEN 2
            WHEN p.Name LIKE '%Wheel%' THEN 2
            WHEN p.Name LIKE '%Frame%' THEN 2

            -- Clothing category
            WHEN p.Name LIKE '%Bib-Shorts%' THEN 3
            WHEN p.Name LIKE '%Caps%' THEN 3
            WHEN p.Name LIKE '%Gloves%' THEN 3
            WHEN p.Name LIKE '%Jersey%' THEN 3
            WHEN p.Name LIKE '%Shorts%' THEN 3
            WHEN p.Name LIKE '%Socks%' THEN 3
            WHEN p.Name LIKE '%Tights%' THEN 3
            WHEN p.Name LIKE '%Vests%' THEN 3

            -- Accessories category
            WHEN p.Name LIKE '%Bike Rack%' THEN 4
            WHEN p.Name LIKE '%Helmet%' THEN 4
            WHEN p.Name LIKE '%Light%' THEN 4
            WHEN p.Name LIKE '%Lock%' THEN 4
            WHEN p.Name LIKE '%Pump%' THEN 4
            WHEN p.Name LIKE '%Tire%' THEN 4
            WHEN p.Name LIKE '%Fender%' THEN 4
            WHEN p.Name LIKE '%Bottle%' THEN 4

            -- If no match found
            ELSE NULL
        END
    ) AS ProductCategoryID,

    -- Handle NULL for ProductSubcategoryID using COALESCE and CASE
    COALESCE(p.ProductSubcategoryID, 
        CASE
            -- Bikes category
            WHEN p.Name LIKE '%Mountain%' THEN 1
            WHEN p.Name LIKE '%Road%' THEN 2
            WHEN p.Name LIKE '%Touring%' THEN 3
                
            -- Components category
            WHEN p.Name LIKE '%Crankarm%' THEN 4
            WHEN p.Name LIKE '%Chainring%' THEN 5
            WHEN p.Name LIKE '%Fork%' THEN 6
            WHEN p.Name LIKE '%Headset%' THEN 7
            WHEN p.Name LIKE '%Pedal%' THEN 8
            WHEN p.Name LIKE '%Brake%' THEN 9
            WHEN p.Name LIKE '%Derailleur%' THEN 10
            WHEN p.Name LIKE '%Bottom Bracket%' THEN 11
            WHEN p.Name LIKE '%Saddle%' THEN 12
            WHEN p.Name LIKE '%Wheel%' THEN 13
            WHEN p.Name LIKE '%Frame%' THEN 14
                
            -- Clothing category
            WHEN p.Name LIKE '%Bib-Shorts%' THEN 15
            WHEN p.Name LIKE '%Caps%' THEN 16
            WHEN p.Name LIKE '%Gloves%' THEN 17
            WHEN p.Name LIKE '%Jersey%' THEN 18
            WHEN p.Name LIKE '%Shorts%' THEN 19
            WHEN p.Name LIKE '%Socks%' THEN 20
            WHEN p.Name LIKE '%Tights%' THEN 21
            WHEN p.Name LIKE '%Vests%' THEN 22
                
            -- Accessories category
            WHEN p.Name LIKE '%Bike Rack%' THEN 23
            WHEN p.Name LIKE '%Helmet%' THEN 24
            WHEN p.Name LIKE '%Light%' THEN 25
            WHEN p.Name LIKE '%Lock%' THEN 26
            WHEN p.Name LIKE '%Pump%' THEN 27
            WHEN p.Name LIKE '%Tire%' THEN 28
            WHEN p.Name LIKE '%Fender%' THEN 29
            WHEN p.Name LIKE '%Bottle%' THEN 30

            -- If no match found
            ELSE NULL
        END
    ) AS ProductSubcategoryID,

    -- Handle NULL for Category using CASE
    CASE
        WHEN psc.ProductCategoryID IS NULL THEN
            CASE
                -- Bikes category
                WHEN p.Name LIKE '%Mountain%' THEN 'Bikes'
                WHEN p.Name LIKE '%Road%' THEN 'Bikes'
                WHEN p.Name LIKE '%Touring%' THEN 'Bikes'

                -- Components category
                WHEN p.Name LIKE '%Crankarm%' THEN 'Components'
                WHEN p.Name LIKE '%Chainring%' THEN 'Components'
                WHEN p.Name LIKE '%Fork%' THEN 'Components'
                WHEN p.Name LIKE '%Headset%' THEN 'Components'
                WHEN p.Name LIKE '%Pedal%' THEN 'Components'
                WHEN p.Name LIKE '%Brake%' THEN 'Components'
                WHEN p.Name LIKE '%Derailleur%' THEN 'Components'
                WHEN p.Name LIKE '%Bottom Bracket%' THEN 'Components'
                WHEN p.Name LIKE '%Saddle%' THEN 'Components'
                WHEN p.Name LIKE '%Wheel%' THEN 'Components'
                WHEN p.Name LIKE '%Frame%' THEN 'Components'

                -- Clothing category
                WHEN p.Name LIKE '%Bib-Shorts%' THEN 'Clothing'
                WHEN p.Name LIKE '%Caps%' THEN 'Clothing'
                WHEN p.Name LIKE '%Gloves%' THEN 'Clothing'
                WHEN p.Name LIKE '%Jersey%' THEN 'Clothing'
                WHEN p.Name LIKE '%Shorts%' THEN 'Clothing'
                WHEN p.Name LIKE '%Socks%' THEN 'Clothing'
                WHEN p.Name LIKE '%Tights%' THEN 'Clothing'
                WHEN p.Name LIKE '%Vests%' THEN 'Clothing'

                -- Accessories category
                WHEN p.Name LIKE '%Bike Rack%' THEN 'Accessories'
                WHEN p.Name LIKE '%Helmet%' THEN 'Accessories'
                WHEN p.Name LIKE '%Light%' THEN 'Accessories'
                WHEN p.Name LIKE '%Lock%' THEN 'Accessories'
                WHEN p.Name LIKE '%Pump%' THEN 'Accessories'
                WHEN p.Name LIKE '%Tire%' THEN 'Accessories'
                WHEN p.Name LIKE '%Fender%' THEN 'Accessories'
                WHEN p.Name LIKE '%Bottle%' THEN 'Accessories'

                -- If no match found
                ELSE 'Uncategorized'
            END
        ELSE pc.Name  -- If the product already has a category, use it
    END AS Category,

    -- Handle NULL for Subcategory using CASE
    CASE
        WHEN p.ProductSubcategoryID IS NULL THEN
            CASE
                -- Bikes category
                WHEN p.Name LIKE '%Mountain%' THEN 'Mountain Bikes'
                WHEN p.Name LIKE '%Road%' THEN 'Road Bikes'
                WHEN p.Name LIKE '%Touring%' THEN 'Touring Bikes'
                
                -- Components category
                WHEN p.Name LIKE '%Crankarm%' THEN 'Cranksets'
                WHEN p.Name LIKE '%Chainring%' THEN 'Chains'
                WHEN p.Name LIKE '%Fork%' THEN 'Forks'
                WHEN p.Name LIKE '%Headset%' THEN 'Headsets'
                WHEN p.Name LIKE '%Pedal%' THEN 'Pedals'
                WHEN p.Name LIKE '%Brake%' THEN 'Brakes'
                WHEN p.Name LIKE '%Derailleur%' THEN 'Derailleurs'
                WHEN p.Name LIKE '%Bottom Bracket%' THEN 'Bottom Brackets'
                WHEN p.Name LIKE '%Saddle%' THEN 'Saddles'
                WHEN p.Name LIKE '%Wheel%' THEN 'Wheels'
                WHEN p.Name LIKE '%Frame%' THEN 'Mountain Frames'
                
                -- Clothing category
                WHEN p.Name LIKE '%Bib-Shorts%' THEN 'Bib-Shorts'
                WHEN p.Name LIKE '%Caps%' THEN 'Caps'
                WHEN p.Name LIKE '%Gloves%' THEN 'Gloves'
                WHEN p.Name LIKE '%Jersey%' THEN 'Jerseys'
                WHEN p.Name LIKE '%Shorts%' THEN 'Shorts'
                WHEN p.Name LIKE '%Socks%' THEN 'Socks'
                WHEN p.Name LIKE '%Tights%' THEN 'Tights'
                WHEN p.Name LIKE '%Vests%' THEN 'Vests'
                
                -- Accessories category
                WHEN p.Name LIKE '%Bike Rack%' THEN 'Bike Racks'
                WHEN p.Name LIKE '%Helmet%' THEN 'Helmets'
                WHEN p.Name LIKE '%Light%' THEN 'Lights'
                WHEN p.Name LIKE '%Lock%' THEN 'Locks'
                WHEN p.Name LIKE '%Pump%' THEN 'Pumps'
                WHEN p.Name LIKE '%Tire%' THEN 'Tires and Tubes'
                WHEN p.Name LIKE '%Fender%' THEN 'Fenders'
                WHEN p.Name LIKE '%Bottle%' THEN 'Bottles and Cages'
                
                -- If no match found
                ELSE 'Uncategorized'
            END
        ELSE psc.Name  -- If the product already has a subcategory, use it
    END AS Subcategory

FROM
    Production.Product p
LEFT JOIN
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
ORDER BY
    p.Name;


-- REDUCED TABLE OF COSTUMER SALES
SELECT
CustomerID, PersonID, TerritoryID
FROM Sales.Customer;


-- REDUCED TABLE OF CUSTOMERS
SELECT
BusinessEntityID, FirstName + ' ' + COALESCE(MiddleName + ' ', '') + LastName AS Customer
FROM Person.Person;

-- REDUCED TABLE OF TERRITORIES
SELECT
TerritoryID, Name AS Territory, CountryRegionCode
FROM Sales.SalesTerritory;


-- Ranking of Territories based on Total Sales with percentage of total sales
WITH TerritorySales AS (
    SELECT
        territory.TerritoryID,
        territory.Name AS Territory,
        SUM(sodh.TotalDue) AS TotalSales
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
    GROUP BY
        territory.TerritoryID, territory.Name
),
TotalSales AS (
    -- Calculate the total sales across all territories
    SELECT SUM(TotalSales) AS TotalSalesAllTerritories
    FROM TerritorySales
)
SELECT
    ts.TerritoryID,
    ts.Territory,
    ts.TotalSales,
    -- Rank the territories based on TotalSales
    RANK() OVER (ORDER BY ts.TotalSales DESC) AS TerritoryRank,
    -- Calculate the percentage of each territory's sales out of total sales
    (ts.TotalSales / tsall.TotalSalesAllTerritories) * 100.0  AS SalesPercentage
FROM
    TerritorySales ts
CROSS JOIN
    TotalSales tsall
ORDER BY
    TerritoryRank;


SELECT 
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN p.ProductSubcategoryID IS NULL THEN 1 ELSE 0 END) AS NullSubcategoryCount,
    SUM(CASE WHEN psc.ProductCategoryID IS NULL THEN 1 ELSE 0 END) AS NullCategoryCount
FROM Production.Product p
LEFT JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID;

-- Product Ranking

SELECT
    sod.ProductID,
    p.Name AS ProductName,

    -- Handle NULL for ProductCategoryID using COALESCE and CASE
    COALESCE(psc.ProductCategoryID, 
        CASE
            -- Bikes category
            WHEN p.Name LIKE '%Mountain%' THEN 1
            WHEN p.Name LIKE '%Road%' THEN 1
            WHEN p.Name LIKE '%Touring%' THEN 1

            -- Components category
            WHEN p.Name LIKE '%Crankarm%' THEN 2
            WHEN p.Name LIKE '%Chainring%' THEN 2
            WHEN p.Name LIKE '%Fork%' THEN 2
            WHEN p.Name LIKE '%Headset%' THEN 2
            WHEN p.Name LIKE '%Pedal%' THEN 2
            WHEN p.Name LIKE '%Brake%' THEN 2
            WHEN p.Name LIKE '%Derailleur%' THEN 2
            WHEN p.Name LIKE '%Bottom Bracket%' THEN 2
            WHEN p.Name LIKE '%Saddle%' THEN 2
            WHEN p.Name LIKE '%Wheel%' THEN 2
            WHEN p.Name LIKE '%Frame%' THEN 2

            -- Clothing category
            WHEN p.Name LIKE '%Bib-Shorts%' THEN 3
            WHEN p.Name LIKE '%Caps%' THEN 3
            WHEN p.Name LIKE '%Gloves%' THEN 3
            WHEN p.Name LIKE '%Jersey%' THEN 3
            WHEN p.Name LIKE '%Shorts%' THEN 3
            WHEN p.Name LIKE '%Socks%' THEN 3
            WHEN p.Name LIKE '%Tights%' THEN 3
            WHEN p.Name LIKE '%Vests%' THEN 3

            -- Accessories category
            WHEN p.Name LIKE '%Bike Rack%' THEN 4
            WHEN p.Name LIKE '%Helmet%' THEN 4
            WHEN p.Name LIKE '%Light%' THEN 4
            WHEN p.Name LIKE '%Lock%' THEN 4
            WHEN p.Name LIKE '%Pump%' THEN 4
            WHEN p.Name LIKE '%Tire%' THEN 4
            WHEN p.Name LIKE '%Fender%' THEN 4
            WHEN p.Name LIKE '%Bottle%' THEN 4

            -- If no match found
            ELSE NULL
        END
    ) AS ProductCategoryID,

    -- Handle NULL for ProductSubcategoryID using COALESCE and CASE
    COALESCE(p.ProductSubcategoryID, 
        CASE
            -- Bikes category
            WHEN p.Name LIKE '%Mountain%' THEN 1
            WHEN p.Name LIKE '%Road%' THEN 2
            WHEN p.Name LIKE '%Touring%' THEN 3
                
            -- Components category
            WHEN p.Name LIKE '%Crankarm%' THEN 4
            WHEN p.Name LIKE '%Chainring%' THEN 5
            WHEN p.Name LIKE '%Fork%' THEN 6
            WHEN p.Name LIKE '%Headset%' THEN 7
            WHEN p.Name LIKE '%Pedal%' THEN 8
            WHEN p.Name LIKE '%Brake%' THEN 9
            WHEN p.Name LIKE '%Derailleur%' THEN 10
            WHEN p.Name LIKE '%Bottom Bracket%' THEN 11
            WHEN p.Name LIKE '%Saddle%' THEN 12
            WHEN p.Name LIKE '%Wheel%' THEN 13
            WHEN p.Name LIKE '%Frame%' THEN 14
                
            -- Clothing category
            WHEN p.Name LIKE '%Bib-Shorts%' THEN 15
            WHEN p.Name LIKE '%Caps%' THEN 16
            WHEN p.Name LIKE '%Gloves%' THEN 17
            WHEN p.Name LIKE '%Jersey%' THEN 18
            WHEN p.Name LIKE '%Shorts%' THEN 19
            WHEN p.Name LIKE '%Socks%' THEN 20
            WHEN p.Name LIKE '%Tights%' THEN 21
            WHEN p.Name LIKE '%Vests%' THEN 22
                
            -- Accessories category
            WHEN p.Name LIKE '%Bike Rack%' THEN 23
            WHEN p.Name LIKE '%Helmet%' THEN 24
            WHEN p.Name LIKE '%Light%' THEN 25
            WHEN p.Name LIKE '%Lock%' THEN 26
            WHEN p.Name LIKE '%Pump%' THEN 27
            WHEN p.Name LIKE '%Tire%' THEN 28
            WHEN p.Name LIKE '%Fender%' THEN 29
            WHEN p.Name LIKE '%Bottle%' THEN 30

            -- If no match found
            ELSE NULL
        END
    ) AS ProductSubcategoryID,

    -- Assign subcategories based on the product name (Same logic as before)
    CASE
        WHEN p.ProductSubcategoryID IS NULL THEN
            CASE
                -- Bikes category
                WHEN p.Name LIKE '%Mountain%' THEN 'Mountain Bikes'
                WHEN p.Name LIKE '%Road%' THEN 'Road Bikes'
                WHEN p.Name LIKE '%Touring%' THEN 'Touring Bikes'
                
                -- Components category
                WHEN p.Name LIKE '%Crankarm%' THEN 'Cranksets'
                WHEN p.Name LIKE '%Chainring%' THEN 'Chains'
                WHEN p.Name LIKE '%Fork%' THEN 'Forks'
                WHEN p.Name LIKE '%Headset%' THEN 'Headsets'
                WHEN p.Name LIKE '%Pedal%' THEN 'Pedals'
                WHEN p.Name LIKE '%Brake%' THEN 'Brakes'
                WHEN p.Name LIKE '%Derailleur%' THEN 'Derailleurs'
                WHEN p.Name LIKE '%Bottom Bracket%' THEN 'Bottom Brackets'
                WHEN p.Name LIKE '%Saddle%' THEN 'Saddles'
                WHEN p.Name LIKE '%Wheel%' THEN 'Wheels'
                WHEN p.Name LIKE '%Frame%' THEN 'Mountain Frames'
                
                -- Clothing category
                WHEN p.Name LIKE '%Bib-Shorts%' THEN 'Bib-Shorts'
                WHEN p.Name LIKE '%Caps%' THEN 'Caps'
                WHEN p.Name LIKE '%Gloves%' THEN 'Gloves'
                WHEN p.Name LIKE '%Jersey%' THEN 'Jerseys'
                WHEN p.Name LIKE '%Shorts%' THEN 'Shorts'
                WHEN p.Name LIKE '%Socks%' THEN 'Socks'
                WHEN p.Name LIKE '%Tights%' THEN 'Tights'
                WHEN p.Name LIKE '%Vests%' THEN 'Vests'
                
                -- Accessories category
                WHEN p.Name LIKE '%Bike Rack%' THEN 'Bike Racks'
                WHEN p.Name LIKE '%Helmet%' THEN 'Helmets'
                WHEN p.Name LIKE '%Light%' THEN 'Lights'
                WHEN p.Name LIKE '%Lock%' THEN 'Locks'
                WHEN p.Name LIKE '%Pump%' THEN 'Pumps'
                WHEN p.Name LIKE '%Tire%' THEN 'Tires and Tubes'
                WHEN p.Name LIKE '%Fender%' THEN 'Fenders'
                WHEN p.Name LIKE '%Bottle%' THEN 'Bottles and Cages'
                
                -- If no match found
                ELSE 'Uncategorized'
            END
        ELSE psc.Name  -- If the product already has a subcategory, use it
    END AS Subcategory,

    -- Handle NULL for Category using CASE
    CASE
        WHEN psc.ProductCategoryID IS NULL THEN
            CASE
                -- Bikes category
                WHEN p.Name LIKE '%Mountain%' THEN 'Bikes'
                WHEN p.Name LIKE '%Road%' THEN 'Bikes'
                WHEN p.Name LIKE '%Touring%' THEN 'Bikes'

                -- Components category
                WHEN p.Name LIKE '%Crankarm%' THEN 'Components'
                WHEN p.Name LIKE '%Chainring%' THEN 'Components'
                WHEN p.Name LIKE '%Fork%' THEN 'Components'
                WHEN p.Name LIKE '%Headset%' THEN 'Components'
                WHEN p.Name LIKE '%Pedal%' THEN 'Components'
                WHEN p.Name LIKE '%Brake%' THEN 'Components'
                WHEN p.Name LIKE '%Derailleur%' THEN 'Components'
                WHEN p.Name LIKE '%Bottom Bracket%' THEN 'Components'
                WHEN p.Name LIKE '%Saddle%' THEN 'Components'
                WHEN p.Name LIKE '%Wheel%' THEN 'Components'
                WHEN p.Name LIKE '%Frame%' THEN 'Components'

                -- Clothing category
                WHEN p.Name LIKE '%Bib-Shorts%' THEN 'Clothing'
                WHEN p.Name LIKE '%Caps%' THEN 'Clothing'
                WHEN p.Name LIKE '%Gloves%' THEN 'Clothing'
                WHEN p.Name LIKE '%Jersey%' THEN 'Clothing'
                WHEN p.Name LIKE '%Shorts%' THEN 'Clothing'
                WHEN p.Name LIKE '%Socks%' THEN 'Clothing'
                WHEN p.Name LIKE '%Tights%' THEN 'Clothing'
                WHEN p.Name LIKE '%Vests%' THEN 'Clothing'

                -- Accessories category
                WHEN p.Name LIKE '%Bike Rack%' THEN 'Accessories'
                WHEN p.Name LIKE '%Helmet%' THEN 'Accessories'
                WHEN p.Name LIKE '%Light%' THEN 'Accessories'
                WHEN p.Name LIKE '%Lock%' THEN 'Accessories'
                WHEN p.Name LIKE '%Pump%' THEN 'Accessories'
                WHEN p.Name LIKE '%Tire%' THEN 'Accessories'
                WHEN p.Name LIKE '%Fender%' THEN 'Accessories'
                WHEN p.Name LIKE '%Bottle%' THEN 'Accessories'

                -- If no match found
                ELSE 'Uncategorized'
            END
        ELSE pc.Name  -- If the product already has a category, use it
    END AS Category,

    -- Total quantity and sales with aggregation
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sodh.TotalDue) AS TotalSales,

    -- Ranking of products based on sales
    RANK() OVER (ORDER BY SUM(sodh.TotalDue) DESC) AS SalesRank

FROM
    Sales.SalesOrderDetail sod
JOIN
    Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
JOIN
    Production.Product p ON sod.ProductID = p.ProductID
LEFT JOIN
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID

GROUP BY
    sod.ProductID,
    p.Name,
    psc.ProductCategoryID,
    p.ProductSubcategoryID,
    psc.Name,
    pc.Name

ORDER BY
    SalesRank;


-- Product Ranking per Territory

SELECT
    sod.ProductID,
    p.Name AS ProductName,
    psc.ProductCategoryID,
    p.ProductSubcategoryID,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sodh.TotalDue) AS TotalSales,
    -- Assign subcategories based on the product name
    CASE
        WHEN p.ProductSubcategoryID IS NULL THEN
            CASE
                -- Bikes category
                WHEN p.Name LIKE '%Mountain%' THEN 'Mountain Bikes'
                WHEN p.Name LIKE '%Road%' THEN 'Road Bikes'
                WHEN p.Name LIKE '%Touring%' THEN 'Touring Bikes'
                
                -- Components category
                WHEN p.Name LIKE '%Crankarm%' THEN 'Cranksets'
                WHEN p.Name LIKE '%Chainring%' THEN 'Chains'
                WHEN p.Name LIKE '%Fork%' THEN 'Forks'
                WHEN p.Name LIKE '%Headset%' THEN 'Headsets'
                WHEN p.Name LIKE '%Pedal%' THEN 'Pedals'
                WHEN p.Name LIKE '%Brake%' THEN 'Brakes'
                WHEN p.Name LIKE '%Derailleur%' THEN 'Derailleurs'
                WHEN p.Name LIKE '%Bottom Bracket%' THEN 'Bottom Brackets'
                WHEN p.Name LIKE '%Saddle%' THEN 'Saddles'
                WHEN p.Name LIKE '%Wheel%' THEN 'Wheels'
                WHEN p.Name LIKE '%Frame%' THEN 'Mountain Frames'
                
                -- Clothing category
                WHEN p.Name LIKE '%Bib-Shorts%' THEN 'Bib-Shorts'
                WHEN p.Name LIKE '%Caps%' THEN 'Caps'
                WHEN p.Name LIKE '%Gloves%' THEN 'Gloves'
                WHEN p.Name LIKE '%Jersey%' THEN 'Jerseys'
                WHEN p.Name LIKE '%Shorts%' THEN 'Shorts'
                WHEN p.Name LIKE '%Socks%' THEN 'Socks'
                WHEN p.Name LIKE '%Tights%' THEN 'Tights'
                WHEN p.Name LIKE '%Vests%' THEN 'Vests'
                
                -- Accessories category
                WHEN p.Name LIKE '%Bike Rack%' THEN 'Bike Racks'
                WHEN p.Name LIKE '%Helmet%' THEN 'Helmets'
                WHEN p.Name LIKE '%Light%' THEN 'Lights'
                WHEN p.Name LIKE '%Lock%' THEN 'Locks'
                WHEN p.Name LIKE '%Pump%' THEN 'Pumps'
                WHEN p.Name LIKE '%Tire%' THEN 'Tires and Tubes'
                WHEN p.Name LIKE '%Fender%' THEN 'Fenders'
                WHEN p.Name LIKE '%Bottle%' THEN 'Bottles and Cages'
                
                -- If no match found
                ELSE 'Uncategorized'
            END
        ELSE psc.Name  -- If the product already has a subcategory, use it
    END AS Subcategory,
    pc.Name AS Category,
    territory.Name AS Territory,
	territory.CountryRegionCode,
    RANK() OVER (PARTITION BY territory.TerritoryID ORDER BY SUM(sodh.TotalDue) DESC) AS SalesRank
FROM
    Sales.SalesOrderDetail sod
JOIN
    Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
JOIN
    Production.Product p ON sod.ProductID = p.ProductID
LEFT JOIN
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN
    Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
GROUP BY
    sod.ProductID,
    p.Name,
    psc.ProductCategoryID,
    p.ProductSubcategoryID,
    psc.Name,
    pc.Name,
    territory.TerritoryID,
	territory.CountryRegionCode,
    territory.Name
ORDER BY
    territory.TerritoryID, SalesRank;


-- Product ranking by category and subcategory, including reassigned categories, limited to ranks 1-4.

WITH CategorySales AS (
    -- Calculate the total sales per category
    SELECT
        psc.ProductCategoryID,
        SUM(sodh.TotalDue) AS TotalSales
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    GROUP BY
        psc.ProductCategoryID
),

SubcategorySales AS (
    -- Calculate the total sales per subcategory within each category
    SELECT
        psc.ProductCategoryID,
        psc.ProductSubcategoryID,
        psc.Name AS Subcategory,
        SUM(sodh.TotalDue) AS TotalSales
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    GROUP BY
        psc.ProductCategoryID, psc.ProductSubcategoryID, psc.Name
)

SELECT
    c.ProductCategoryID,
    pc.Name AS Category,
    s.ProductSubcategoryID,
    s.Subcategory,
    s.TotalSales,
    
    -- Rank subcategories within each category
    RANK() OVER (PARTITION BY s.ProductCategoryID ORDER BY s.TotalSales DESC) AS SubcategoryRank,
    
    -- Rank categories based on the total sales of all their subcategories
    -- Limit the category ranking between 1 and 4 (since there are only 4 categories)
    CASE 
        WHEN c.ProductCategoryID = 1 THEN 1
        WHEN c.ProductCategoryID = 2 THEN 2
        WHEN c.ProductCategoryID = 3 THEN 3
        WHEN c.ProductCategoryID = 4 THEN 4
    END AS CategoryRank

FROM
    SubcategorySales s
JOIN
    CategorySales c ON s.ProductCategoryID = c.ProductCategoryID
JOIN
    Production.ProductCategory pc ON s.ProductCategoryID = pc.ProductCategoryID

ORDER BY
    CategoryRank, SubcategoryRank;


-- TOP 20 Customer (based on sales).

WITH 
    SalesRanking AS (
        SELECT 
            CustomerID,
            COUNT(*) AS Quantity,
            SUM(TotalDue) AS TotalSales,
            ROW_NUMBER() OVER (
                ORDER BY SUM(TotalDue) DESC
            ) AS Ranking
        FROM Sales.SalesOrderHeader
        GROUP BY CustomerID
    )
SELECT 
    ranking.Ranking,
	ranking.CustomerID,
    -- Concatenate the customer name
    p.FirstName + ' ' + COALESCE(p.MiddleName + ' ', '') + p.LastName AS CustomerName, 
    ranking.Quantity,
    ranking.TotalSales
FROM SalesRanking ranking
-- Join with the Sales.Customer table
JOIN Sales.Customer c ON ranking.CustomerID = c.CustomerID
-- Join with the Person.Person table to get customer names
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE ranking.Ranking <= 20  -- Select only the top 20 customers
ORDER BY ranking.Ranking;



-- Show the number of units sold by product category and territory

WITH UnitsTable AS (
    SELECT 
        territory.TerritoryID,
        territory.Name AS Territory,
        c.Name AS Category,
        detail.OrderQty AS Quantity
    FROM Sales.SalesOrderHeader soh
    LEFT JOIN Sales.SalesTerritory territory 
        ON soh.TerritoryID = territory.TerritoryID
    LEFT JOIN Sales.SalesOrderDetail detail 
        ON soh.SalesOrderID = detail.SalesOrderID
    LEFT JOIN Production.Product product
        ON detail.ProductID = product.ProductID
    LEFT JOIN Production.ProductSubcategory ps 
        ON product.ProductSubcategoryID = ps.ProductSubcategoryID
    LEFT JOIN Production.ProductCategory c 
        ON ps.ProductCategoryID = c.ProductCategoryID
)
SELECT
    Territory,
    TerritoryID,
    Category,
    SUM(Quantity) AS Quantity
FROM UnitsTable
GROUP BY
    Territory,
    TerritoryID,
    Category
ORDER BY 
    TerritoryID, Category;


-- TOP 5 customers of category accessories for each territory and region.


WITH AccessoriesPurchases AS (
    -- Calculate the total sales (TotalDue) spent on accessories and the total quantity of accessories bought by each customer per territory
    SELECT
        territory.TerritoryID,
        territory.Name AS Territory,
        territory.CountryRegionCode,
        customer.CustomerID,
        SUM(sod.LineTotal) AS TotalSpentOnAccessories,  -- Total spent on accessories
        SUM(sod.OrderQty) AS TotalAccessoriesBought  -- Sum of quantities of accessories bought
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN
        Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
    JOIN
        Sales.Customer customer ON sodh.CustomerID = customer.CustomerID
    WHERE
        psc.Name IN ('Bike Racks', 'Helmets', 'Lights', 'Locks', 'Pumps', 'Tires and Tubes', 'Fenders', 'Bottles and Cages')  -- Accessories category
    GROUP BY
        territory.TerritoryID, territory.Name, territory.CountryRegionCode, customer.CustomerID
)

SELECT
    ap.TerritoryID,
    ap.Territory,
    ap.CountryRegionCode,
    ap.CustomerID,
    -- Concatenate customer name
    p.FirstName + ' ' + COALESCE(p.MiddleName + ' ', '') + p.LastName AS CustomerName,
    ap.TotalSpentOnAccessories,
    ap.TotalAccessoriesBought,  -- Including the total quantity of accessories bought
    ap.AccessoriesSpendingRank
FROM (
    SELECT
        ap.TerritoryID,
        ap.Territory,
        ap.CountryRegionCode,
        ap.CustomerID,
        ap.TotalSpentOnAccessories,
        ap.TotalAccessoriesBought,  -- Including the total quantity of accessories bought
        ROW_NUMBER() OVER (PARTITION BY ap.TerritoryID ORDER BY ap.TotalSpentOnAccessories DESC) AS AccessoriesSpendingRank
    FROM
        AccessoriesPurchases ap
) AS ap
-- Join to get customer names
JOIN Sales.Customer c ON ap.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE
    ap.AccessoriesSpendingRank <= 5
ORDER BY
    ap.TerritoryID, ap.AccessoriesSpendingRank;


-- TOP 5 customers of category clothing for each territory and region.


WITH ClothingPurchases AS (
    -- Calculate the total sales (TotalDue) spent on clothing and the total quantity of clothing bought by each customer per territory
    SELECT
        territory.TerritoryID,
        territory.Name AS Territory,
        territory.CountryRegionCode,
        customer.CustomerID,
        SUM(sod.LineTotal) AS TotalSpentOnClothing,  -- Total spent on clothing
        SUM(sod.OrderQty) AS TotalClothingBought  -- Sum of quantities of clothing bought
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN
        Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
    JOIN
        Sales.Customer customer ON sodh.CustomerID = customer.CustomerID
    WHERE
        psc.Name IN ('Bib-Shorts', 'Caps', 'Gloves', 'Jerseys', 'Shorts', 'Socks', 'Tights', 'Vests')  -- Clothing category
    GROUP BY
        territory.TerritoryID, territory.Name, territory.CountryRegionCode, customer.CustomerID
)

SELECT
    cp.TerritoryID,
    cp.Territory,
    cp.CountryRegionCode,
    cp.CustomerID,
    -- Concatenate customer name
    p.FirstName + ' ' + COALESCE(p.MiddleName + ' ', '') + p.LastName AS CustomerName,
    cp.TotalSpentOnClothing,
    cp.TotalClothingBought,  -- Including the total quantity of clothing bought
    cp.ClothingSpendingRank
FROM (
    SELECT
        cp.TerritoryID,
        cp.Territory,
        cp.CountryRegionCode,
        cp.CustomerID,
        cp.TotalSpentOnClothing,
        cp.TotalClothingBought,  -- Including the total quantity of clothing bought
        ROW_NUMBER() OVER (PARTITION BY cp.TerritoryID ORDER BY cp.TotalSpentOnClothing DESC) AS ClothingSpendingRank
    FROM
        ClothingPurchases cp
) AS cp
-- Join to get customer names
JOIN Sales.Customer c ON cp.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE
    cp.ClothingSpendingRank <= 5
ORDER BY
    cp.TerritoryID, cp.ClothingSpendingRank;


-- TOP 5 customers of caterogry components for each territory and region.


WITH ComponentPurchases AS (
    -- Calculate the total sales (TotalDue) spent on components and the total quantity of components bought by each customer per territory
    SELECT
        territory.TerritoryID,
        territory.Name AS Territory,
        territory.CountryRegionCode,
        customer.CustomerID,
        SUM(sod.LineTotal) AS TotalSpentOnComponents,  -- Total spent on components
        SUM(sod.OrderQty) AS TotalComponentsBought  -- Sum of quantities of components bought
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN
        Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
    JOIN
        Sales.Customer customer ON sodh.CustomerID = customer.CustomerID
    WHERE
        psc.Name IN ('Handlebars', 'Bottom Brackets', 'Brakes', 'Chains', 'Cranksets', 'Derailleurs', 'Forks', 
                     'Headsets', 'Mountain Frames', 'Pedals', 'Road Frames', 'Saddles', 'Touring Frames', 'Wheels')  -- Components category
    GROUP BY
        territory.TerritoryID, territory.Name, territory.CountryRegionCode, customer.CustomerID
)

SELECT
    cp.TerritoryID,
    cp.Territory,
    cp.CountryRegionCode,
    cp.CustomerID,
    -- Concatenate customer name
    p.FirstName + ' ' + COALESCE(p.MiddleName + ' ', '') + p.LastName AS CustomerName,
    cp.TotalSpentOnComponents,
    cp.TotalComponentsBought,  -- Including the total quantity of components bought
    cp.ComponentSpendingRank
FROM (
    SELECT
        cp.TerritoryID,
        cp.Territory,
        cp.CountryRegionCode,
        cp.CustomerID,
        cp.TotalSpentOnComponents,
        cp.TotalComponentsBought,  -- Including the total quantity of components bought
        ROW_NUMBER() OVER (PARTITION BY cp.TerritoryID ORDER BY cp.TotalSpentOnComponents DESC) AS ComponentSpendingRank
    FROM
        ComponentPurchases cp
) AS cp
-- Join to get customer names
JOIN Sales.Customer c ON cp.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE
    cp.ComponentSpendingRank <= 5
ORDER BY
    cp.TerritoryID, cp.ComponentSpendingRank;


-- TOP 5 customers of category bikes for each territory and region.
	

WITH BikePurchases AS (
    -- Calculate the total sales (TotalDue) spent on bikes and the total quantity of bikes bought by each customer per territory
    SELECT
        territory.TerritoryID,
        territory.Name AS Territory,
        territory.CountryRegionCode,
        customer.CustomerID,
        SUM(sod.LineTotal) AS TotalSpentOnBikes,
        SUM(sod.OrderQty) AS TotalBikesBought
    FROM
        Sales.SalesOrderDetail sod
    JOIN
        Sales.SalesOrderHeader sodh ON sod.SalesOrderID = sodh.SalesOrderID
    JOIN
        Production.Product p ON sod.ProductID = p.ProductID
    LEFT JOIN
        Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN
        Sales.SalesTerritory territory ON sodh.TerritoryID = territory.TerritoryID
    JOIN
        Sales.Customer customer ON sodh.CustomerID = customer.CustomerID
    WHERE
        psc.Name IN ('Mountain Bikes', 'Road Bikes', 'Touring Bikes')  -- Bikes category
    GROUP BY
        territory.TerritoryID, territory.Name, territory.CountryRegionCode, customer.CustomerID
)

SELECT
    bp.TerritoryID,
    bp.Territory,
    bp.CountryRegionCode,
    bp.CustomerID,
    -- Concatenate customer name
    p.FirstName + ' ' + COALESCE(p.MiddleName + ' ', '') + p.LastName AS CustomerName,
    bp.TotalSpentOnBikes,
    bp.TotalBikesBought,
    bp.BikeSpendingRank
FROM (
    SELECT
        bp.TerritoryID,
        bp.Territory,
        bp.CountryRegionCode,
        bp.CustomerID,
        bp.TotalSpentOnBikes,
        bp.TotalBikesBought,
        ROW_NUMBER() OVER (PARTITION BY bp.TerritoryID ORDER BY bp.TotalSpentOnBikes DESC) AS BikeSpendingRank
    FROM
        BikePurchases bp
) AS bp
-- Join to get customer names
JOIN Sales.Customer c ON bp.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE
    bp.BikeSpendingRank <= 5
ORDER BY
    bp.TerritoryID, bp.BikeSpendingRank;
