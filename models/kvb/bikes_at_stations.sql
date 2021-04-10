select
    point_in_time as point_in_time,
    bike_name as location_name,
    True as is_at_station,
    longitude as longitude,
    latitude as latitude,
    regexp_split_to_table(bike_numbers, ',') as bike_number
from kvb_stations
where bike_numbers != ''