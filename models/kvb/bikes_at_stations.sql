SELECT
    point_in_time AS point_in_time,
    bike_name AS location_name,
    True AS is_at_station,
    longitude AS longitude,
    latitude AS latitude,
    regexp_split_to_table(bike_numbers, ',') AS bike_number
FROM kvb_stations
WHERE bike_numbers != ''
