SELECT
    point_in_time                            AS point_in_time,
    regexp_split_to_table(bike_numbers, ',') AS bike_number,
    bike_name                                AS location,
    True                                     AS is_at_station,
    longitude                                AS longitude,
    latitude                                 AS latitude
FROM kvb_stations
where bike_numbers != ''
