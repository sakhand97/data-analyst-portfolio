-- Monthly revenue & profit trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM orders
GROUP BY month
ORDER BY month;


-- Region performance with profit margin
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- Category contribution to total revenue
SELECT 
    category,
    SUM(sales) AS revenue,
    ROUND(
        SUM(sales) * 100 / (SELECT SUM(sales) FROM orders),
        2
    ) AS revenue_share_pct
FROM orders
GROUP BY category
ORDER BY revenue DESC;


-- Discount vs profitability analysis
SELECT 
    discount,
    COUNT(*) AS order_count,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY discount
ORDER BY discount;


-- Loss-making customer segments
SELECT 
    segment,
    SUM(profit) AS total_profit
FROM orders
GROUP BY segment
HAVING total_profit < 0;
