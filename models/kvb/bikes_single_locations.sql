select distinct
    bike_number,
    location_name,
    longitude,
    latitude,
    min(point_in_time) over (partition by bike_number, longitude, latitude) as first_seen_at,
    max(point_in_time) over (partition by bike_number, longitude, latitude) as last_seen_at
from {{ ref('all_bikes') }}
order by 1, 4