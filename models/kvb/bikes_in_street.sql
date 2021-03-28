select
    point_in_time AS point_in_time,
    bike_numbers  AS bike_number,
    'street'      AS location,
    False         AS is_at_station,
    longitude     AS longitude,
    latitude      AS latitude
from bikes
