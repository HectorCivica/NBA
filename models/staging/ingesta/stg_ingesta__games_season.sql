with 

base as (

    select * from {{ ref('base_ingesta__games') }}

)

select  game_id,
        season,
        game_date_est
 from base
