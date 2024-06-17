


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
        detail_id,
        A.game_id,
        team_id,
        team_abbreviation,
        team_city,
        player_id,
        player_name,
        nickname,
        start_position,
        case
            when comment is null then 'No comments'
            else comment
        end as comment,
        case
            when mins is null then '0:00'
            when mins = '0' then '0:00'
            when mins = '-2' then '0:00'
            when mins = '-3' then '0:00'
            when mins = '-4' then '0:00'
            when mins = '-5' then '0:00'
            when mins = '-7' then '0:00'
            when mins = '-8' then '0:00'
            when mins = '-9' then '0:00'
            else mins
        end as mins,
        case 
        when fgm is null then 0
        else fgm
        end as fgm,
        case 
        when fga is null then 0
        else fga
        end as fga,
        case 
        when fg_pct is null then 0
        else fg_pct
        end as fg_pct,
        case 
        when fg3m is null then 0
        else fg3m
        end as fg3m,
        case 
        when fg3a is null then 0
        else fg3a
        end as fg3a,
        case 
        when fg3_pct is null then 0
        else fg3_pct
        end as fg3_pct,
        case 
        when ftm is null then 0
        else ftm
        end as ftm,
        case 
        when fta is null then 0
        else fta
        end as fta,
        case 
        when ft_pct is null then 0
        else ft_pct
        end as ft_pct,
        case 
        when oreb is null then 0
        else oreb
        end as oreb,
        case 
        when dreb is null then 0
        else dreb
        end as dreb,
        case 
        when reb is null then 0
        else reb
        end as reb,
        case 
        when ast is null then 0
        else ast
        end as ast,
        case 
        when stl is null then 0
        else stl
        end as stl,
        case 
        when blk is null then 0
        else blk
        end as blk,
        case 
        when to_ is null then 0
        else to_
        end as to_,
        case 
        when pf is null then 0
        else pf
        end as pf,
        case 
        when pts is null then 0
        else pts
        end as pts,
        case 
        when plus_minus is null then 0
        else plus_minus
        end as plus_minus,
        _fivetran_synced
 from cte_games_details A
 join cte_games_season B on A.game_id=B.game_id
 
