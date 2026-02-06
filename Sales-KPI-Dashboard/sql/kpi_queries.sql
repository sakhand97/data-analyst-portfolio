-- Core KPIs
SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders;

-- Top 10 products by revenue
SELECT 
    product_name,
    SUM(sales) AS revenue
FROM orders
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- Repeat customers
SELECT 
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING order_count > 1;

-- Shipping performance
SELECT 
    ship_mode,
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 1) AS avg_shipping_days
FROM orders
GROUP BY ship_mode;
