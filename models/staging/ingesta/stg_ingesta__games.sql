{{ config(
    materialized='incremental',
    unique_key='game_id'
) }}





with 

base as (

    select * from {{ ref('base_ingesta__games') }}

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
        home_team_wins,
        _fivetran_synced
 from base

{% if is_incremental() %}
    WHERE _fivetran_synced > (SELECT MAX(_fivetran_synced) FROM {{ this }} )
{% endif %}