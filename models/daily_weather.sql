with
    cte_weather as (
        select date(time) as daily_weather, weather, clouds, humidity, pressure, temp
        from {{ source("db_src", "weather") }}
    ),

    cte_weather_agg as (
        select
            daily_weather,
            weather,
            avg(clouds) as avg_clouds,
            avg(humidity) as avg_humidity,
            avg(pressure) as avg_pressure,
            avg(temp) as avg_temp
        from cte_weather
        group by daily_weather, weather
        qualify
            row_number() over (partition by daily_weather order by count(weather) desc)
            = 1

    )

select *
from cte_weather_agg
