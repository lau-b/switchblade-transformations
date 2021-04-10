SELECT
    bike_number,
    location_name,
    first_seen_at,
    last_seen_at,
    longitude AS starting_long,
    latitude AS starting_lat,
    LEAD(longitude) OVER (PARTITION BY bike_number) AS destination_lng,
    LEAD(latitude) OVER (PARTITION BY bike_number) AS destination_lat
FROM {{ ref('bikes_single_locations') }}
