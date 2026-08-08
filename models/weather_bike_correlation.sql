with cte1 as 
(
select 
t.*,
d.*
from {{ ref('trip_fact') }} t
left outer join {{ ref('daily_weather') }} d
on t.trip_date=d.daily_weather
)

select * from cte1