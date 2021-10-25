{%- macro limit_data_in_dev ( date_column, days_back=3 ) -%}

{%- if target.name == 'dev' -%}
    where {{ date_column }} >= date_sub ( date(current_timestamp), INTERVAL {{ days_back }} DAY )
{%- endif -%}

{%- endmacro %}