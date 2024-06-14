with 

source as (

    select * from {{ source('ingesta', 'games_details') }}

),

renamed as (

    select
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
        round(plus_minus)as plus_minus

    from source

)

select * from renamed
