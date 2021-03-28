SELECT DISTINCT
    bike_number,
    longitude,
    latitude,
    min(point_in_time) OVER (PARTITION BY bike_number, longitude, latitude) AS first_seen_at,
    max(point_in_time) OVER (PARTITION BY bike_number, longitude, latitude) AS last_seen_at
FROM {{ ref('all_bikes') }}
