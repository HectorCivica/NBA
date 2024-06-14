{{
  config(
    materialized = "view",
  )
}}

with 
base as (
select league_id from {{ ref('base_ingesta__teams') }} 
),


dimension_liga as (

select distinct league_id,
case 
    when league_id=0 then 'NBA'
    when league_id=1 then 'ACB'
    end as league_name,

from base

)

select * from dimension_liga