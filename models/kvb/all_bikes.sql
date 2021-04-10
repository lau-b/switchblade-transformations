SELECT
    point_in_time,
    bike_number,
    location_name,
    is_at_station,
    longitude,
    latitude
FROM {{ ref('bikes_at_stations') }}
UNION ALL
SELECT
    point_in_time,
    bike_number,
    location_name,
    is_at_station,
    longitude,
    latitude
FROM {{ ref('bikes_in_street') }}
