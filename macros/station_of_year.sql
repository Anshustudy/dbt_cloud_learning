{% macro station_of_year() %}
    case
        when month(to_timestamp(started_at)) in (12, 1, 2)
        then 'WINTER'
        when month(to_timestamp(started_at)) in (3, 4, 5)
        then 'SPRING'
        when month(to_timestamp(started_at)) in (6, 7, 8)
        then 'SUMMER'
        else 'AUTUMN'
    end 
{% endmacro %}
