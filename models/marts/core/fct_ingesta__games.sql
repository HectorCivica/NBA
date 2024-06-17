with 

cte_int_games as (

    select * from {{ ref('int_ingesta__games') }}

)

select game_date_est,
        game_id,
        home_team_id,
        visitor_team_id,
        home_team_wins as win_id,
        season,
        pts_home,
        fg_pct_home,
        ft_pct_home,
        fg3_pct_home,
        ast_home,
        reb_home,
        pts_away,
        fg_pct_away,
        ft_pct_away,
        fg3_pct_away,
        ast_away,
        reb_away
        
 from cte_int_games
