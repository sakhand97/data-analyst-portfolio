# 📊 Sales Analysis Dashboard – Power BI

## 🔍 Project Overview
This Power BI project analyzes multi-year Superstore sales data and presents insights across three structured dashboard pages:

1. Executive Overview  
2. Profitability Deep Dive  
3. Regional & Customer Insights  

The dashboard is designed using proper data modeling and time intelligence techniques.

---

# 📄 Dashboard Structure

## 1️⃣ Executive Overview
![Executive Overview](EXECUTIVE OVERVIEW.png)
This page provides a high-level business summary.

### KPIs Included:
- Total Sales
- Total Profit
- Profit Margin %
- Sales Growth %
- Total Quantity

### Visuals:
- Monthly Sales Trend
- Sales Growth % by Category
- Sales by Region & Category
- Quantity by Category

🎯 Purpose: Quick performance snapshot for management-level decision making.

---

## 2️⃣ Profitability Deep Dive
![Profitability Deep Dive](Profitability_Deep_Dive.png)
This page focuses on profit analysis and margin behavior.

### Analysis Includes:
- Profit by Category
- Profit by Sub-Category
- Margin comparison
- Loss-making segments identification

🎯 Purpose: Identify high-margin and low-margin business areas.

---

## 3️⃣ Regional & Customer Insights
![Regional & Customer Insights](Regional_Insights.png)

This page analyzes geographical and customer-based performance.

### Analysis Includes:
- Region-wise Sales
- Customer contribution
- Segment-level comparison
- Regional distribution trends

🎯 Purpose: Understand revenue distribution and customer concentration.

---

# 🏗 Data Modeling

- Fact Table: Orders
- Dimension Table: Date Table
- One-to-Many relationship (Date → Orders)
- Single direction filtering
- Star Schema structure

---

# 🗓 Custom Date Table

```DAX
Date Table =
ADDCOLUMNS(
    CALENDAR(MIN(Orders[Order Date]), MAX(Orders[Order Date])),
    "Year", YEAR([Date]),
    "Month", FORMAT([Date], "MMM"),
    "Month No", MONTH([Date]),
    "YearMonth", FORMAT([Date], "YYYY-MM")
)
```

✔ Enables proper time intelligence  
✔ Handles missing years safely  

---

# 📐 Core DAX Measures

## Total Sales

```DAX
Total Sales =
SUM(Orders[Sales])
```

## Sales Last Year

```DAX
Sales LY =
CALCULATE(
    [Total Sales],
    DATEADD('Date Table'[Date], -1, YEAR)
)
```

## Sales Growth %

```DAX
Sales Growth % =
VAR CurrentSales = [Total Sales]
VAR PreviousSales = [Sales LY]

RETURN
IF(
    NOT ISBLANK(CurrentSales) &&
    NOT ISBLANK(PreviousSales) &&
    PreviousSales <> 0,
    DIVIDE(CurrentSales - PreviousSales, PreviousSales)
)
```

✔ Defensive logic applied  
✔ Handles incomplete year comparisons  
✔ Prevents misleading growth values  

---

# 🛡 Data Considerations

The dataset contains missing transaction years (2020–2022).  
Blank handling was intentionally implemented instead of forcing zero values to maintain analytical integrity.

---

# 🧠 Technical Skills Demonstrated

- Star Schema Modeling
- Time Intelligence (YoY Growth)
- Context Handling in DAX
- Measure Branching
- Defensive DAX Programming
- Business-Oriented Dashboard Design

---

# 📁 Files Included

- Sample-Superstore.xlsx
- Dashboard Screenshots
- Data Model Screenshot

---

# 🚀 Conclusion

This project demonstrates the ability to design a structured multi-page analytical dashboard, implement robust DAX calculations, and generate business-ready insights from transactional data.
