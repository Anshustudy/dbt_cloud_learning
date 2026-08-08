with
    cte_bike as (
        select
            ride_id,
            rideable_type,
            date(to_timestamp(started_at)) as trip_date,
            start_statio_id as start_station_id,
            end_station_id,
            member_csual,
            timestampdiff(
                second, to_timestamp(started_at), to_timestamp(ended_at)
            ) as trip_suration_sec
        from {{ source("db_src", "bike") }}
        where start_lng != 'start_lng'
    )

select *
from cte_bike
