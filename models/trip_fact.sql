with
    cte_bike as (
        select
           RIDE_ID, RIDEABLE_TYPE, DATE(TO_TIMESTAMP(STARTED_AT)),
           START_STATIO_ID as START_STATION_ID,
           END_STATION_ID,
           MEMBER_CSUAL,
           TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) as TRIP_SURATION_SEC
        from {{ source("db_src", "bike") }}
        where start_lng != 'start_lng'
    )

select *
from cte_bike