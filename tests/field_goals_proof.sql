-- Se comprueba que los porcentajes sean correctos
select fgm,fga,fg_pct
from {{ref('stg_ingesta__games_details')}}
where fgm is not null and fga !=0 and fg_pct!=round(fgm/fga,3)