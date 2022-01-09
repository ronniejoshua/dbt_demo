{% macro convert_calendar_field_to_boolean(column_name) %}

--convert a field to boolean in case it's a VARCHAR flag.
case 
    when {{column_name}} is null then false 
    when {{column_name}} in ('Y', 'WTD', 'WTD_LYR', 'MTD', 'MTD_LYR', 'QTD', 'QTD_LYR', 'YTD', 'YTD_LYR') then true 
    end as {{column_name}}

{% endmacro %}
