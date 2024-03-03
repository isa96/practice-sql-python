#1709. Biggest Window Between Visits
SELECT user_id, MAX(diff) AS biggest_window
FROM
(
    SELECT
        user_id,
        DATEDIFF(LEAD(visit_date, 1, '2021-1-1')OVER(PARTITION BY user_id ORDER BY visit_date), visit_date) AS diff
    FROM UserVisits
)a
GROUP BY user_id