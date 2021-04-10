select
    bike_number,
    location_name,
    first_seen_at,
    last_seen_at,
    longitude as starting_long,
    latitude as starting_lat,
    LEAD(longitude) over (partition by bike_number) as destination_lng,
    LEAD(latitude) over (partition by bike_number) as destination_lat
from {{ ref('bikes_single_locations') }}