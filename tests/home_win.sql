-- Se comprueba que la columna home_team_wins tiene sentido
select game_id, pts_home, pts_away, home_team_wins
from {{ref('stg_ingesta__games')}}
where (home_team_wins=1 and pts_home<pts_away) or (home_team_wins=0 and pts_home>pts_away)