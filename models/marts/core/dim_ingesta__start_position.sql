with 
base as (
select * from {{ ref('stg_ingesta__dim_start_position') }} 
)

select 
id_start_position,
start_position,
desc_start_position
from base