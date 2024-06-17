with 

source as (

    select * from {{ ref("base_ingesta__games_details") }}

),

renamed as (

    select
        distinct(start_position) as start_position,
        {{ dbt_utils.generate_surrogate_key(['start_position']) }} as id_start_position,
        case
        when start_position='F' then 'Forward'
        when start_position='G' then 'Guard'
        when start_position='C' then 'Center'
        when start_position='B' then 'Bench'
        end as desc_start_position
    from source

)

select * from renamed