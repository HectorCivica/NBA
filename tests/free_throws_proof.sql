-- Se comprueba que los porcentajes sean correctos
select ftm,fta,ft_pct
from {{ref('stg_ingesta__games_details')}}
where ftm is not null and fta !=0 and ft_pct!=round(ftm/fta,3)