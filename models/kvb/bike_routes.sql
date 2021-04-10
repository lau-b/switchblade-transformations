select
    bike_number,
    location_name,
    last_seen_at as route_started_at,
    longitude as starting_lng,
    latitude as starting_lat,
    LEAD(longitude) over (partition by bike_number) as destination_lng,
    LEAD(latitude) over (partition by bike_number) as destination_lat
from {{ ref('bikes_single_locations') }}
