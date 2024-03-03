# 1831. Maximum Transaction Each Day

WITH cte AS
(
    SELECT DATE(day) AS d_day, MAX(amount) AS max_amt
    FROM Transactions
    GROUP BY 1
)

SELECT transaction_id
FROM Transactions a
JOIN cte b
ON DATE(a.day) = b.d_day
AND a.amount = b.max_amt
ORDER BY 1
