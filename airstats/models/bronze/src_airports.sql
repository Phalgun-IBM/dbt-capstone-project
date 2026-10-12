{{ config(materialized='ephemeral') }}
WITH src_airports AS (
    SELECT * FROM {{ source('airstats', 'airports') }}
)

SELECT
    sa.ident AS airport_ident,
    sa.type AS airport_type,
    sa.name AS airport_name,
    sa.latitude_deg AS airport_lat,
    sa.longitude_deg AS airport_long,
    sa.continent,
    sa.iso_country,
    sa.iso_region
FROM src_airports AS sa