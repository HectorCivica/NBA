{{ config(
    materialized='table',
    on_schema_change='fail'
    ) 
}}

with 

cte_games_details_season_date as(
    select *
    from {{ ref('int_ingesta__games_details_season') }}
)

select  game_date_est,
        season,
        game_id,
        team_id,
        team_abbreviation,
        team_city,
        player_id,
        player_name,
        nickname,
        start_position,
        comment,
        min,
        fgm,
        fga,
        fg_pct,
        fg3m,
        fg3a,
        fg3_pct,
        ftm,
        fta,
        ft_pct,
        oreb,
        dreb,
        reb,
        ast,
        stl,
        blk,
        to_,
        pf,
        pts,
        plus_minus
 from cte_games_details_season_date
 