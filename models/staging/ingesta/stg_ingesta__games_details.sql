{{ config(
    materialized='incremental',
    unique_key='detail_id'
) }}


with 

source as (

    select * from {{ ref("base_ingesta__games_details") }}

),

renamed as (

    select
        detail_id,
        game_id,
        team_id,
        team_abbreviation,
        team_city,
        player_id,
        player_name,
        nickname,
        {{ dbt_utils.generate_surrogate_key(['start_position']) }} as start_position_id,
        comment,
        mins,
        round(fgm) as fgm,
        round(fga)as fga,
        round(fg_pct,3) as fg_pct,
        round(fg3m)as fg3m,
        round(fg3a)as fg3a,
        round(fg3_pct,3)as fg3_pct,
        round(ftm)as ftm,
        round(fta)as fta,
        round(ft_pct,3)as ft_pct,
        round(oreb)as oreb,
        round(dreb)as dreb,
        round(reb)as reb,
        round(ast)as ast,
        round(stl)as stl,
        round(blk)as blk,
        round(to_)as to_,
        round(pf)as pf,
        round(pts)as pts,
        round(plus_minus)as plus_minus,
        _fivetran_synced
    from source

)

--select * from renamed


--select * from 
--(select distinct *, count(*) as cnt from source
--group by all) subquery
--where cnt=1

select * from renamed

{% if is_incremental() %}
    WHERE _fivetran_synced > (SELECT MAX(_fivetran_synced) FROM {{ this }} )
{% endif %}