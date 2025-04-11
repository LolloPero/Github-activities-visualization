{{ config(materialized='table') }}

SELECT
    r.repo_name,
    r.actor_login,
    COUNT(DISTINCT r.created_at) AS active_days,
    SUM(u.lines_added) AS lines_added,
    SUM(u.lines_deleted) AS lines_deleted
FROM 
        {{ ref('repository_activity') }} r
JOIN    
        {{ ref('user_contributions') }} u
ON
    r.repo_name = u.repo_name
    AND r.actor_login = u.actor_login
    AND DATE(r.created_at) = DATE(u.created_at)
GROUP BY
    r.repo_name, r.actor_login
ORDER BY
    lines_added DESC
