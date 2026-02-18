# 🚴 Adventure Works Sales Dashboard

An end-to-end data analytics project built on the **Adventure Works** database. Sales data was extracted and cleaned using **SQL Server**, then loaded into **Power BI** to build an interactive multi-page dashboard.

---

## 📊 Dashboard Preview

### Overview
<img width="1412" height="765" alt="OVERVIEW" src="https://github.com/user-attachments/assets/fa26ea6b-bb66-41f3-8dd3-11bec025e4f2" />

> High-level KPIs: total sales ($123M), total customers (20K), total products (121K), and average sales per customer ($6.44M). Includes a bar chart of sales by territory and a ranking of the top 20 customers.
### Products
<img width="1340" height="776" alt="PRODUCTS" src="https://github.com/user-attachments/assets/45db34c8-152d-4510-8032-e65b6c6794d4" />

> Product sales ranked by category and subcategory, a bubble chart of the top 10 subcategories, and a treemap showing revenue share by product category (Bikes, Components, Clothing, Accessories).

### Customers
<img width="1362" height="780" alt="CUSTOMERS" src="https://github.com/user-attachments/assets/00971141-e33c-45c6-b2b9-95441ac02084" />

> Top 5 customers per territory broken down by product category: Bikes, Clothing, Accessories, and Components.

### Territory
<img width="1381" height="770" alt="TERRITORY" src="https://github.com/user-attachments/assets/9cb67157-5c4d-46c3-9a90-95f8fb42e123" />

> Territory sales ranking with revenue totals and percentage share, plus a stacked bar chart of units sold by category and territory.

Download Dashboard: 
(https://drive.google.com/file/d/1t0UEDWUIjnn8ho75XpQWnJ8SkTEE8L6n/view?usp=drive_link)
---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Data extraction and cleaning |
| Power BI | Data modeling and visualization |
| Adventure Works DB | Source dataset |

---

## 🗂️ SQL Queries Overview

The SQL script (`AdventureWorks_Project.sql`) prepares all the data consumed by the Power BI report. It includes:

**Base tables extracted from the database:**
- `Sales.SalesOrderHeader` → Order-level data (ID, date, customer, territory, total)
- `Sales.SalesOrderDetail` → Line-level data (quantity, product, unit price)
- `Production.ProductCategory` / `ProductSubcategory` → Product hierarchy
- `Production.Product` → Product master

**Data cleaning — NULL handling:**
Many products in Adventure Works have `NULL` values for `ProductSubcategoryID` and `ProductCategoryID`. These were resolved using `COALESCE` combined with `CASE` statements that infer the correct category/subcategory from the product name (pattern matching with `LIKE`). This allowed full category-level analysis without losing uncategorized products.

**Ranking queries using Window Functions:**
- Top 20 customers overall by total sales
- Product sales rankings by category and subcategory (`ROW_NUMBER() OVER PARTITION BY`)
- Territory sales ranking with percentage share of total revenue
- Top 5 customers per territory for each product category (Bikes, Clothing, Accessories, Components) — each built as a CTE + windowed ranking subquery

---

## 📁 Project Structure

```
adventure-works-dashboard/
│
├── AdventureWorks_Project.sql          # All SQL queries for data extraction and cleaning
├── README.md
└── images/
    ├── overview.png
    ├── products.png
    ├── customers.png
    └── territory.png
```

---

## 📌 Key Insights

- **Southwest** is the top-performing territory with $27.1M in sales (22% of total).
- **Bikes** dominate revenue, led by Road Bikes ($624M) and Mountain Bikes ($357M).
- The **top 20 customers** collectively account for over $16.3M in sales.
- **Canada** and **Northwest** closely compete for the #2 and #3 territory spots (~$18M each).

---

## 📄 Data Source

[Adventure Works Sample Database](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure) — Microsoft's official sample OLTP database simulating a bicycle manufacturer's operations.

