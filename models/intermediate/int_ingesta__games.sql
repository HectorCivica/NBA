

with 

cte_int_games as (

    select * from {{ ref('stg_ingesta__games') }}

),

cte_int_games_details as (
    select distinct game_id from {{ ref('stg_ingesta__games_details')}}
)

select game_date_est,
        A.game_id,
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
        home_team_wins,
        _fivetran_synced
 from cte_int_games A
 join cte_int_games_details B on
 A.game_id=B.game_id
order by A.game_id

