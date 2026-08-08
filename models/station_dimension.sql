with
    cte_bike as (
        select
            start_statio_id as start_station_id,
            start_station_name,
            start_lat,
            start_lng
        from {{ source("db_src", "bike") }}
        where start_lng != 'start_lng'
    )

select *
from cte_bike
