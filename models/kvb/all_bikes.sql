SELECT *
FROM {{ ref('bikes_at_stations') }}
UNION
SELECT *
FROM {{ ref('bikes_in_street') }}
