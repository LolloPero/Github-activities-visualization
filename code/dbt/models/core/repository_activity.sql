
{{ config(materialized='table') }}

with 

source as (

    select * from {{ source('staging', 'github') }}

)


select
        JSON_VALUE(repo, '$.name') as repo_name,
        type as event_type,
        JSON_VALUE(actor, '$.login') as actor_login,
        created_at,
        JSON_VALUE(payload, '$.action') as action,
        SAFE_CasT(JSON_VALUE(payload, '$.pull_request.additions') as INT64) as additions,
        SAFE_CasT(JSON_VALUE(payload, '$.pull_request.deletions') as INT64) as deletions

from source

where 
    type IN ('PushEvent', 'PullRequestEvent')
