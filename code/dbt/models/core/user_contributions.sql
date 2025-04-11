{{ config(materialized='table') }}

with 

source as (

    select * from {{ source('staging', 'github') }}

)

select
  JSON_VALUE(actor, '$.login') as actor_login,
  JSON_VALUE(repo, '$.name') as repo_name,
  type as event_type,
  created_at,
  SAFE_CasT(JSON_VALUE(payload, '$.pull_request.additions') as INT64) as lines_added,
  SAFE_CasT(JSON_VALUE(payload, '$.pull_request.deletions') as INT64) as lines_deleted
from source
where type in (
  'PushEvent', 'PullRequestEvent',
  'IssuesEvent', 'IssueCommentEvent',
  'PullRequestReviewCommentEvent'
)
