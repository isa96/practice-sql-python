# 1633. Percentage of Users Attended a Contest

SELECT contest_id,
ROUND(
100*(COUNT(DISTINCT user_id))
/
(SELECT COUNT(DISTINCT user_id) FROM users)
, 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC
