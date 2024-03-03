# 1843. Suspicious Bank Accounts

WITH temp AS (
    SELECT t.account_id, DATE_FORMAT(day, '%Y%m') AS month, SUM(amount) AS total_income, a.max_income
    FROM Transactions t
    LEFT JOIN Accounts a
    ON t.account_id = a.account_id
    WHERE t.type = 'Creditor'
    GROUP BY t.account_id, DATE_FORMAT(day, '%Y%m')
    HAVING SUM(amount) > a.max_income
)

SELECT t1.account_id
FROM temp t1, temp t2
WHERE t1.account_id = t2.account_id AND PERIOD_DIFF(t1.month, t2.month) = 1
GROUP BY 1
ORDER BY 1