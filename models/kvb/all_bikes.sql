select
    point_in_time,
    bike_number,
    location_name,
    is_at_station,
    longitude,
    latitude
from {{ ref('bikes_at_stations') }}
union all
select
    point_in_time,
    bike_number,
    location_name,
    is_at_station,
    longitude,
    latitude
from {{ ref('bikes_in_street') }}