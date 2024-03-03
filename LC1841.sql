# 1841. League Statistics

SELECT
    team_name,
    COUNT(*) AS matches_played, 
    SUM(CASE
            WHEN home > away THEN 3
            WHEN home = away THEN 1
        ELSE 0 END) AS points,
    SUM(home) AS goal_for,
    SUM(away) AS goal_against,
    SUM(home) - SUM(away) AS goal_diff
FROM
(
    SELECT home_team_id, home_team_goals AS home, away_team_goals AS away FROM Matches
    UNION ALL
    SELECT away_team_id, away_team_goals AS home, home_team_goals AS away FROM Matches
) a
JOIN Teams t
ON a.home_team_id = t.team_id
GROUP BY team_name
ORDER BY points DESC, goal_diff DESC, team_name