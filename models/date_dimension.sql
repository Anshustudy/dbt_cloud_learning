with
    cte as (
        select
            to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            case
                when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
                then 'WEEKND'
                else 'BUSINESSDAY'
            end as day_type,
            {{ station_of_year('started_at') }} as station_of_year

        from {{ source("db_src", "bike") }}
        where started_at != 'started_at'
    )

select *
from cte
