SELECT order_id, customer_id, order_date, total_price
FROM online_orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31'
UNION ALL
SELECT order_id, customer_id, order_date, total_price
FROM offline_orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31'
ORDER BY order_date;