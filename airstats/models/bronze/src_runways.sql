{{ config(materialized='ephemeral') }}
WITH src_runways AS (
    SELECT * FROM {{ source('airstats', 'runways') }}
)

SELECT
    sr.id AS runway_id,
    sr.airport_ident,
    sr.length_ft AS runway_length_ft,
    sr.width_ft AS runway_width_ft,
    sr.surface AS runway_surface,
    sr.lighted AS runway_lighted,
    sr.closed AS runway_closed
FROM src_runways AS sr