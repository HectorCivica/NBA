with 

source as (

    select * from {{ source('ingesta', 'games') }}

),

renamed as (

    SELECT *
FROM (
    SELECT 
           COUNT(*) OVER (PARTITION BY game_id) AS cnt,
           *
    FROM source
) subquery
WHERE cnt = 1
-- Esto es para no repetir filas. Se puede utilizar macro

)

select game_date_est,
        game_id,
        game_status_text,
        home_team_id,
        visitor_team_id,
        season,
        team_id_home,
        round(pts_home) as pts_home,
        round(fg_pct_home,3) as fg_pct_home,
        round(ft_pct_home,3) as ft_pct_home,
        round(fg3_pct_home,3) as fg3_pct_home,
        round(ast_home) as ast_home,
        round(reb_home) as reb_home,
        team_id_away,
        round(pts_away) as pts_away,
        round(fg_pct_away,3) as fg_pct_away,
        round(ft_pct_away,3) as ft_pct_away,
        round(fg3_pct_away,3) as fg3_pct_away,
        round(ast_away) as ast_away,
        round(reb_away) as reb_away,
        home_team_wins,
        _fivetran_synced
 from renamed
where season<=2019