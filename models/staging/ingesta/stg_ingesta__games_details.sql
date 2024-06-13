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

    from source

)

select * from renamed
