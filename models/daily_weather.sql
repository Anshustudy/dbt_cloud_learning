with
    cte_weather as (
        select date(time) as daily_weather, weather, clouds, humidity, pressure, temp
        from {{ source("db_src", "weather") }}
    ),

cte_weather_agg as 
(
select 
daily_weather,
weather,
avg(clouds) as clouds,
avg(humidity) as humidity,
avg(pressure) as pressure,
avg(temp) as temp
qualify row_number() over(partiton by daily_weather order by count(weather) desc)=1
from cte_weather 
group by daily_weather

)

select *
from cte_weather_agg
