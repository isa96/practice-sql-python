#1555. Bank Account Summary
SELECT 
    user_id,
    user_name,
    IFNULL(SUM(CASE WHEN u.user_id = t.paid_by THEN -amount ELSE amount END), 0) + u.credit AS credit,
    CASE WHEN IFNULL(SUM(CASE WHEN u.user_id = t.paid_by THEN -amount ELSE amount END), 0) >= - u.credit THEN "No" ELSE "Yes" END AS credit_limit_breached
FROM Users u
LEFT JOIN Transactions t
ON u.user_id = t.paid_by OR u.user_id = t.paid_to
GROUP BY 1

