SELECT
    CASE
        WHEN stock_quantity = 0 THEN '품절'
        WHEN stock_quantity <= 10 THEN '재고 부족'
        ELSE '재고 충분'
    END AS stock_status,
    COUNT(*) AS product_count
FROM products
GROUP BY stock_status
ORDER BY product_count DESC;