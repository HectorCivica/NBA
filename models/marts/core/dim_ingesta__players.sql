with 

source as (

    select * from {{ ref('stg_ingesta__players') }}

),

renamed as (

    select
        player_name,
        team_id,
        player_id,
        season

    from source

)

select * from renamed
