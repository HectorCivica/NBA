-- Se comprueba que la columna home_team_wins tiene sentido
select fg3m,fg3a,fg3_pct
from {{ref('stg_ingesta__games_details')}}
where fg3m is not null and fg3a !=0 and fg3_pct!=round(fg3m/fg3a,3)