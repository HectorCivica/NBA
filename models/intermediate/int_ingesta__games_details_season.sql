{{ config(
    materialized='view',
    on_schema_change='fail'
    ) 
}}

with cte_games_details as(
    select *
    from {{ ref('stg_ingesta__games_details') }}
),

cte_games_season as(
    select *
    from {{ ref('stg_ingesta__games_season') }}
)

select  game_date_est,
        season,
        A.game_id,
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
 from cte_games_details A
 join cte_games_season B on A.game_id=B.game_id
 