
with 
base as (
select * from {{ ref('stg_ingesta__dim_win') }} 
)

select 
home_team_wins as win_id,
who_wins as desc_win
from base