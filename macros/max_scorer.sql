{% macro calculate_top_points_scorers(game_id) %}
WITH source AS (
    SELECT * FROM {{ ref('fct_ingesta__games_details_season') }}
)

SELECT
    player_id,
    max(pts) AS total_pts 
FROM source
GROUP BY all
{% endmacro %}