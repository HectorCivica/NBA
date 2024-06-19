{{ config(
    materialized='incremental',
    unique_key='detail_id'
    ) 
}}

with 

cte_games_details_season_date as(
    select *
    from {{ ref('int_ingesta__games_details_season') }}
)

select   game_date_est,
        season,
        detail_id,
        game_id,
        team_id,
        --team_abbreviation,
        --team_city,
        player_id,
        --player_name,
        --nickname,
        start_position as start_position_id, 
        comment,
        mins,
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
        plus_minus,
        _fivetran_synced
 from cte_games_details_season_date
 
{% if is_incremental() %}
    WHERE _fivetran_synced > (SELECT MAX(_fivetran_synced) FROM {{ this }} )
{% endif %}