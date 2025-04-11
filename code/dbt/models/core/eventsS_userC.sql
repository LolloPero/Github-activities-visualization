{{ config(materialized='table') }}

SELECT
  e.event_type,
  u.actor_login,
  e.repo_name,
  DATE(e.created_at) AS event_date,
  SUM(u.lines_added) AS total_lines_added,
  SUM(u.lines_deleted) AS total_lines_deleted
FROM
  {{ ref('events_summary') }} e
JOIN
  {{ ref('user_contributions') }} u
ON
  e.repo_name = u.repo_name
  AND e.actor_login = u.actor_login
  AND DATE(e.created_at) = DATE(u.created_at)
GROUP BY
  e.event_type, u.actor_login, e.repo_name, event_date
ORDER BY
  event_date DESC
