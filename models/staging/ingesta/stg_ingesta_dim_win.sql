{{
  config(
    materialized = "view",
  )
}}

with 
base as (
select home_team_wins from {{ ref('base_ingesta__games') }} 
),


dimension_win as (

select distinct home_team_wins,
case 
    when home_team_wins=1then 'Home wins'
    when home_team_wins=0 then 'Away wins'
    end as who_wins,

from base

)

select * from dimension_win