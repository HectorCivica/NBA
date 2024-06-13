{{
  config(
    materialized = "view",
  )
}}

with 
base as (
select * from {{ ref('base_ingesta__games') }} 
),


dimension_season as (

select distinct season,
{{ dbt_utils.generate_surrogate_key(['season']) }} as season_id
from base

)

select * from dimension_season