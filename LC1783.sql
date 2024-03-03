# 1783. Grand Slam Titles

SELECT 
    player_id, 
    player_name,
    SUM(player_id = Wimbledon) + SUM(player_id = Fr_open) + SUM(player_id = US_open) + SUM(player_id = Au_open) AS grand_slams_count
FROM Players p
JOIN Championships c
ON p.player_id = c.Wimbledon OR p.player_id = c.Fr_open OR p.player_id = c.US_open OR p.player_id = c.Au_open
GROUP BY 1