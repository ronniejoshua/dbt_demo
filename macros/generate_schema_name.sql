-- https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-schemas

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}
        {%- if default_schema == 'DEPLOY' -%}
            {{ custom_schema_name }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name | trim }}
        {%- endif -%}

    {%- endif -%}

{%- endmacro %}