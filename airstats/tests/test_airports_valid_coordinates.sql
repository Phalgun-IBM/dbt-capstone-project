SELECT
    airport_ident,
    airport_name,
    airport_lat,
    airport_long
FROM {{ ref('silver_airports') }}
WHERE
    (airport_lat IS NOT NULL AND (airport_lat < -90 OR airport_lat > 90))
    OR (airport_long IS NOT NULL AND (airport_long < -180 OR airport_long > 180))