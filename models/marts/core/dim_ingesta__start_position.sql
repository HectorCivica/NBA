with 
base as (
select * from {{ ref('stg_ingesta__dim_start_position') }} 
)

select start_position_id,
start_position,
desc_start_position
from base