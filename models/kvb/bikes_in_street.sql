select
    point_in_time as point_in_time,
    'street' as location_name,
    False as is_at_station,
    longitude as longitude,
    latitude as latitude,
    bike_numbers as bike_number
from bikes