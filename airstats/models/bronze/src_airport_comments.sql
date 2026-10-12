{{ config(materialized='ephemeral') }}
WITH src_airport_comments AS (
    SELECT * FROM {{ source('airstats', 'comments') }}
)

SELECT
    sac.id AS comment_id,
    sac.airport_ident,
    sac.date AS comment_timestamp,
    sac.member_nickname,
    sac.subject AS comment_subject,
    sac.body AS comment_body
FROM src_airport_comments AS sac