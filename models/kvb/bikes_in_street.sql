SELECT
    point_in_time AS point_in_time,
    'street' AS location_name,
    False AS is_at_station,
    longitude AS longitude,
    latitude AS latitude,
    bike_numbers AS bike_number
FROM bikes
