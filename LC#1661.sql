# 1661. Average Time of Process per Machine

SELECT machine_id, 
ROUND(
(((SUM(IF(activity_type = 'end', timestamp, 0)) - SUM(IF(activity_type = 'start', timestamp, 0)))) / COUNT(DISTINCT process_id))
, 3) AS processing_time
FROM activity
GROUP BY machine_id
