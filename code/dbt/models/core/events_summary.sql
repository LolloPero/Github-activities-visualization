{{ config(materialized='table') }}

with 

source as (

    select * from {{ source('staging', 'github') }}

)

select
    id,
    type as event_type,
    created_at,
    JSON_VALUE(repo, '$.name') AS repo_name,
    JSON_VALUE(actor, '$.login') AS actor_login,
    JSON_VALUE(org, '$.login') AS org_login
from source
where   id IS NOT NULL AND
        type IS NOT NULL AND
        created_at IS NOT NULL AND
        JSON_VALUE(repo, '$.name') IS NOT NULL AND
        JSON_VALUE(actor, '$.login') IS NOT NULL AND
        JSON_VALUE(org, '$.login') IS NOT NULL


