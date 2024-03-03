# 1613. Find the Missing IDs
WITH RECURSIVE cte (ids) AS
(
    SELECT 1 AS ids
    UNION ALL
    SELECT ids + 1 FROM cte WHERE ids < (SELECT MAX(customer_id) FROM Customers)
)

SELECT ids
FROM cte
WHERE ids NOT IN (SELECT customer_id FROM Customers)
ORDER BY ids