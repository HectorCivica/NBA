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
    

)

select game_date_est,
        game_id,
        game_status_text,
        home_team_id,
        visitor_team_id,
        season,
        team_id_home,
        pts_home,
        fg_pct_home,
        ft_pct_home,
        fg3_pct_home,
        ast_home,
        reb_home,
        team_id_away,
        pts_away,
        fg_pct_away,
        ft_pct_away,
        fg3_pct_away,
        ast_away,
        reb_away,
        home_team_wins
 from renamed
