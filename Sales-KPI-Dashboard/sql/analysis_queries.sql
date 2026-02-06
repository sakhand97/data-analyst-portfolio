SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM orders
GROUP BY month
ORDER BY month;
