# 1596. The Most Frequently Ordered Products for Each Customer

WITH cte AS
(
    SELECT customer_id, product_id, COUNT(order_date) AS order_freq
    FROM Orders
    GROUP BY 1, 2
    ORDER BY 1, 3 DESC
),
cte2 AS
(SELECT customer_id, product_id, DENSE_RANK()OVER(PARTITION BY customer_id ORDER BY order_freq DESC) AS rnk
FROM cte)

SELECT t.customer_id, t.product_id, product_name
FROM cte2 t
LEFT JOIN Products p
ON t.product_id = p.product_id
WHERE rnk = 1