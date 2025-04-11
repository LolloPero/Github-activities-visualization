{{ config(materialized='table') }}

SELECT
  e.repo_name,
  e.actor_login,
  e.event_type,
  DATE(e.created_at) AS event_date,
  COUNT(*) AS event_count,
  SUM(r.additions) AS repo_additions,
  SUM(r.deletions) AS repo_deletions,
  SUM(u.lines_added) AS user_lines_added,
  SUM(u.lines_deleted) AS user_lines_deleted
FROM
  {{ ref('events_summary') }} e
JOIN
  {{ ref('repository_activity') }} r
ON
  e.repo_name = r.repo_name
  AND e.actor_login = r.actor_login
  AND DATE(e.created_at) = DATE(r.created_at)
JOIN
  {{ ref('user_contributions') }} u
ON
  e.repo_name = u.repo_name
  AND e.actor_login = u.actor_login
  AND DATE(e.created_at) = DATE(u.created_at)
GROUP BY
  e.repo_name, e.actor_login, e.event_type, event_date
ORDER BY
  event_date DESC
