with 
base as (
select * from {{ ref('stg_ingesta__dim_start_position') }} 
)

select 
start_position as start_position_id,
desc_start_position
from base