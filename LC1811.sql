# 1811. Find Interview Candidates

WITH temp0 AS
(
    SELECT gold_medal AS user, contest_id FROM Contests
    UNION ALL
    SELECT silver_medal AS user, contest_id FROM Contests
    UNION ALL
    SELECT bronze_medal AS user, contest_id FROM Contests
)
, temp1 AS
(
    SELECT user, contest_id, ROW_NUMBER()OVER(PARTITION BY user ORDER BY contest_id) AS rn
    FROM temp0
)
, temp2 AS
(
    SELECT user FROM temp1
    GROUP BY user, contest_id - rn
    HAVING COUNT(*) >= 3
    UNION ALL
    SELECT gold_medal AS user FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
)

SELECT DISTINCT name, mail
FROM Users u
INNER JOIN temp2 t
ON u.user_id = t.user